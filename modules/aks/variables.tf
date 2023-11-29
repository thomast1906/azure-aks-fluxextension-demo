variable "aks_name" {
}

variable "location" {
}

variable "resource_group_name" {
}

variable "kubernetes_version" {
}

variable "environment" {
}

variable "agent_count" {
}

variable "vm_size" {
}

variable "aks_subnet_id" {
}

variable "log_analytics_workspace_id" {
}

variable "appgateway_subnet_id" {
}

variable "aks_admins_group_object_id" {
}

variable "tags" {
  type = map(string)
}

variable "ssh_public_key" {
}
