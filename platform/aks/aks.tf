module "aks" {
  source = "../../modules/aks"

  aks_name = format("aks-%s",
    var.environment
  )
  location = var.location

  kubernetes_version = var.kubernetes_version

  resource_group_name = data.azurerm_resource_group.resource_group.name
  tags                = var.tags

  agent_count                = var.agent_count
  vm_size                    = var.vm_size
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics_workspace.id
  aks_subnet_id              = data.azurerm_subnet.aks.id
  appgateway_subnet_id       = data.azurerm_subnet.appgateway.id
  environment                = var.environment

  aks_admins_group_object_id = var.aks_admins_group_object_id

  ssh_public_key = var.ssh_public_key
}
