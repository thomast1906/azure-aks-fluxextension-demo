resource "azurerm_resource_group" "resource_group" {
  name = format("rg-aks-%s",
    var.environment
  )
  location = var.location
  tags     = var.tags
}

module "log_analytics" {
  source = "../../modules/log_analytics"

  log_analytics_workspace_name = format("la-aks-%s",
    var.environment
  )
  environment                 = var.environment
  location                    = var.location
  log_analytics_workspace_sku = var.log_analytics_workspace_sku

  resource_group_name = azurerm_resource_group.resource_group.name
  tags                = var.tags

}

module "container_registry" {
  source = "../../modules/container_registry"

  acr_name = format("acraks%s",
    var.environment
  )
  acr_sku  = var.acr_sku
  location = var.location

  resource_group_name = azurerm_resource_group.resource_group.name
  tags                = var.tags

}