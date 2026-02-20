resource "azurerm_linux_function_app" "main" {
  name                = "func-${var.project_name}-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_key

  site_config {
    application_stack {
      node_version = var.function_runtime == "node" ? "18" : null
      python_version = var.function_runtime == "python" ? "3.9" : null
      dotnet_version = var.function_runtime == "dotnet" ? "6.0" : null
    }

    cors {
      allowed_origins = ["*"]
    }

    application_insights_connection_string = azurerm_application_insights.main.connection_string
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME       = var.function_runtime
    FUNCTIONS_EXTENSION_VERSION    = var.function_version
    COSMOSDB_ENDPOINT             = var.cosmosdb_endpoint
    COSMOSDB_KEY                  = var.cosmosdb_primary_key
    WEBSITE_RUN_FROM_PACKAGE      = "1"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "azurerm_application_insights" "main" {
  name                = "appi-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}