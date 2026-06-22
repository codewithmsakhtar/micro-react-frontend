output "aks_ids" {
  value = {
    for k, v in azurerm_kubernetes_cluster.aks : k => v.id
  }
}