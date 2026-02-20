variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "service_plan_id" {
  description = "ID of the service plan"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "storage_account_key" {
  description = "Access key for the storage account"
  type        = string
  sensitive   = true
}

variable "cosmosdb_endpoint" {
  description = "Cosmos DB endpoint"
  type        = string
}

variable "cosmosdb_primary_key" {
  description = "Cosmos DB primary key"
  type        = string
  sensitive   = true
}

variable "function_runtime" {
  description = "Function runtime (e.g., node, python, dotnet)"
  type        = string
}

variable "function_version" {
  description = "Function runtime version"
  type        = string
}