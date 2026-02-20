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

variable "consistency_level" {
  description = "Cosmos DB consistency level"
  type        = string
}

variable "throughput" {
  description = "Cosmos DB throughput (RU/s)"
  type        = number
}

variable "database_name" {
  description = "Cosmos DB database name"
  type        = string
}

variable "container_name" {
  description = "Cosmos DB container name"
  type        = string
}