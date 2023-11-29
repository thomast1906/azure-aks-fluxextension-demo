resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_name
  kubernetes_version  = var.kubernetes_version

  node_resource_group = "rg-aksnode-${var.environment}"

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  default_node_pool {
    name                 = "agentpool"
    node_count           = var.agent_count
    vm_size              = var.vm_size
    vnet_subnet_id       = var.aks_subnet_id
    type                 = "VirtualMachineScaleSets"
    orchestrator_version = var.kubernetes_version
  }

  identity {
    type = "SystemAssigned"
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }


  ingress_application_gateway {
    gateway_id = azurerm_application_gateway.aks.id
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "azure"
  }

  azure_active_directory_role_based_access_control {
    azure_rbac_enabled     = false
    managed                = true
    admin_group_object_ids = [var.aks_admins_group_object_id]
  }

  tags = var.tags

  depends_on = [
    azurerm_application_gateway.aks
  ]

}
