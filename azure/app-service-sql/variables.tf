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

variable "app_service_plan_sku" {
  description = "App Service Plan SKU"
  type        = string
  default     = "B1"
}

variable "docker_image" {
  description = "Docker image name"
  type        = string
}

variable "docker_tag" {
  description = "Docker image tag"
  type        = string
  default     = "latest"
}

variable "app_port" {
  description = "Port exposed by the application"
  type        = number
  default     = 3000
}

variable "health_check_path" {
  description = "Health check path for App Service"
  type        = string
  default     = "/health"
}

variable "sql_server_admin_password" {
  description = "Password for SQL Server administrator"
  type        = string
  sensitive   = true
}

variable "database_sku" {
  description = "Database SKU (e.g., Basic, S0, S1)"
  type        = string
  default     = "Basic"
}

variable "database_max_size_gb" {
  description = "Maximum database size in GB"
  type        = number
  default     = 2
}