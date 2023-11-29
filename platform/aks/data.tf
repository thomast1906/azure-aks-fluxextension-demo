data "azurerm_resource_group" "resource_group" {
  name = format("rg-aks-%s",
    var.environment
  )
}

data "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name = format("la-aks-%s",
    var.environment
  )
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

data "azurerm_subnet" "aks" {
  name = "aks"
  virtual_network_name = format("vnet-aks-%s",
    var.environment
  )
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

data "azurerm_subnet" "appgateway" {
  name = "appgateway"
  virtual_network_name = format("vnet-aks-%s",
    var.environment
  )
  resource_group_name = data.azurerm_resource_group.resource_group.name
}