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

variable "sql_server_admin_password" {
  description = "Password for SQL Server administrator (optional - auto-generated if not provided)"
  type        = string
  sensitive   = true
  default     = null
}

variable "database_sku" {
  description = "Database SKU (e.g., Basic, S0, S1)"
  type        = string
}

variable "max_size_gb" {
  description = "Maximum database size in GB"
  type        = number
}