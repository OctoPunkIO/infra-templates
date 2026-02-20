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

variable "app_service_plan_sku" {
  description = "App Service Plan SKU"
  type        = string
}

variable "docker_image" {
  description = "Docker image name"
  type        = string
}

variable "docker_tag" {
  description = "Docker image tag"
  type        = string
}

variable "app_port" {
  description = "Port exposed by the application"
  type        = number
}

variable "health_check_path" {
  description = "Health check path for App Service"
  type        = string
}

variable "database_connection_string" {
  description = "Database connection string"
  type        = string
  sensitive   = true
}