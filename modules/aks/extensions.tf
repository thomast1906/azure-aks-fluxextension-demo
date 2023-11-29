resource "azurerm_kubernetes_cluster_extension" "flux" {
  name           = "flux"
  cluster_id     = azurerm_kubernetes_cluster.k8s.id
  extension_type = "microsoft.flux"
}

resource "azurerm_kubernetes_flux_configuration" "k8s_flux" {
  name       = "flux-system"
  cluster_id = azurerm_kubernetes_cluster.k8s.id
  namespace  = "flux-system"

  git_repository {
    url             = "https://github.com/thomast1906/azure-aks-flux2config-demo"
    reference_type  = "branch"
    reference_value = "main"
  }

  kustomizations {
    name                      = "kustomization-2"
    path                      = "./clusters/production/00"
    sync_interval_in_seconds  = 120
    retry_interval_in_seconds = 120

  }

  scope = "cluster"

  depends_on = [
    azurerm_kubernetes_cluster_extension.flux
  ]
}