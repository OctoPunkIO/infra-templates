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

variable "aks_subnet_id" {
  description = "ID of the AKS subnet"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "system_node_count" {
  description = "Number of system nodes"
  type        = number
}

variable "system_node_vm_size" {
  description = "VM size for system nodes"
  type        = string
}

variable "user_node_count" {
  description = "Number of user nodes"
  type        = number
}

variable "user_node_vm_size" {
  description = "VM size for user nodes"
  type        = string
}

variable "enable_auto_scaling" {
  description = "Enable auto-scaling for user node pool"
  type        = bool
}

variable "user_node_min_count" {
  description = "Minimum number of user nodes when auto-scaling is enabled"
  type        = number
}

variable "user_node_max_count" {
  description = "Maximum number of user nodes when auto-scaling is enabled"
  type        = number
}