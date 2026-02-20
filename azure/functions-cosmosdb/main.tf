terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstateaccount"
    container_name       = "tfstate"
    key                  = "functions-cosmosdb/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project_name
      ManagedBy   = "terraform"
    }
  }
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.azure_region
}

resource "azurerm_storage_account" "main" {
  name                     = "st${replace(var.project_name, "-", "")}${var.environment}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = var.storage_replication_type

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "azurerm_service_plan" "main" {
  name                = "asp-${var.project_name}-${var.environment}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type             = "Linux"
  sku_name            = var.function_app_sku
}

module "cosmosdb" {
  source = "./modules/cosmosdb"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  project_name        = var.project_name
  environment         = var.environment
  consistency_level   = var.cosmosdb_consistency_level
  throughput          = var.cosmosdb_throughput
  database_name       = var.cosmosdb_database_name
  container_name      = var.cosmosdb_container_name
}

module "functions" {
  source = "./modules/functions"

  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  project_name         = var.project_name
  environment          = var.environment
  service_plan_id      = azurerm_service_plan.main.id
  storage_account_name = azurerm_storage_account.main.name
  storage_account_key  = azurerm_storage_account.main.primary_access_key
  cosmosdb_endpoint    = module.cosmosdb.endpoint
  cosmosdb_primary_key = module.cosmosdb.primary_key
  function_runtime     = var.function_runtime
  function_version     = var.function_version
}