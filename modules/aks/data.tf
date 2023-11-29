data "azurerm_resource_group" "node_resource_group" {
  name = "rg-aksnode-${var.environment}"
  depends_on = [
    azurerm_kubernetes_cluster.k8s
  ]
}

data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
  depends_on = [
    azurerm_kubernetes_cluster.k8s
  ]
}

data "azurerm_container_registry" "acr" {
  name = format("acraks%s",
    var.environment
  )
  resource_group_name = data.azurerm_resource_group.resource_group.name
}