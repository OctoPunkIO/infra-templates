variable "azure_region" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "storage_replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}

variable "function_app_sku" {
  description = "Function App service plan SKU"
  type        = string
  default     = "Y1"
}

variable "function_runtime" {
  description = "Function runtime (e.g., node, python, dotnet)"
  type        = string
  default     = "node"
}

variable "function_version" {
  description = "Function runtime version"
  type        = string
  default     = "~4"
}

variable "cosmosdb_consistency_level" {
  description = "Cosmos DB consistency level"
  type        = string
  default     = "Session"
}

variable "cosmosdb_throughput" {
  description = "Cosmos DB throughput (RU/s)"
  type        = number
  default     = 400
}

variable "cosmosdb_database_name" {
  description = "Cosmos DB database name"
  type        = string
  default     = "main"
}

variable "cosmosdb_container_name" {
  description = "Cosmos DB container name"
  type        = string
  default     = "items"
}