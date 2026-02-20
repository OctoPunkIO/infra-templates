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
    key                  = "app-service-sql/terraform.tfstate"
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

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.azure_region
}

module "sql_database" {
  source = "./modules/sql-database"

  resource_group_name       = azurerm_resource_group.main.name
  location                  = azurerm_resource_group.main.location
  project_name              = var.project_name
  environment               = var.environment
  sql_server_admin_password = var.sql_server_admin_password
  database_sku              = var.database_sku
  max_size_gb               = var.database_max_size_gb
}

module "app_service" {
  source = "./modules/app-service"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  project_name        = var.project_name
  environment         = var.environment

  app_service_plan_sku       = var.app_service_plan_sku
  docker_image               = var.docker_image
  docker_tag                 = var.docker_tag
  app_port                   = var.app_port
  health_check_path          = var.health_check_path
  database_connection_string = module.sql_database.connection_string
}