variable "location" {
}

variable "environment" {}

variable "kubernetes_version" {
}

variable "agent_count" {
}

variable "vm_size" {
}

variable "aks_admins_group_object_id" {
}

variable "tags" {
  type = map(string)
}

variable "deployment_subscription_id" {
}

variable "ssh_public_key" {
}