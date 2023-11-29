locals {
  resource_group_name = format("rg-aks-%s",
    var.environment
  )

  log_analytics_workspace_name = format("la-aks-%s",
    var.environment
  )

}