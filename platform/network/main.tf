data "azurerm_resource_group" "resource_group" {
  name = local.resource_group_name
}

data "azurerm_log_analytics_workspace" "log_analytics" {
  name                = local.log_analytics_workspace_name
  resource_group_name = local.resource_group_name
}

module "virtual_network" {
  source = "../../modules/virtual_network"

  virtual_network_name = format("vnet-aks-%s",
    var.environment
  )
  location = var.location

  resource_group_name = local.resource_group_name

  virtual_network_address_space = var.virtual_network_address_space
  subnets                       = var.virtual_network_subnets

  tags = var.tags
}