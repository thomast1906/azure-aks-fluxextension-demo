variable "location" {
  default = "uksouth"
}

variable "environment" {
}

variable "tags" {
  type = map(string)
}

variable "deployment_subscription_id" {
}

variable "log_analytics_workspace_sku" {
  default = "PerGB2018"
}

variable "acr_sku" {
}