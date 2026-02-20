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

variable "vnet_cidr" {
  description = "CIDR block for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aks_subnet_cidr" {
  description = "CIDR block for AKS subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = null
}

variable "system_node_count" {
  description = "Number of system nodes"
  type        = number
  default     = 2
}

variable "system_node_vm_size" {
  description = "VM size for system nodes"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "user_node_count" {
  description = "Number of user nodes"
  type        = number
  default     = 3
}

variable "user_node_vm_size" {
  description = "VM size for user nodes"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "enable_auto_scaling" {
  description = "Enable auto-scaling for user node pool"
  type        = bool
  default     = true
}

variable "user_node_min_count" {
  description = "Minimum number of user nodes when auto-scaling is enabled"
  type        = number
  default     = 1
}

variable "user_node_max_count" {
  description = "Maximum number of user nodes when auto-scaling is enabled"
  type        = number
  default     = 10
}