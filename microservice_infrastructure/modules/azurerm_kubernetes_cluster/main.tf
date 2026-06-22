resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.aks_clusters

  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  sku_tier = "Free"   # 👈 Free tier

 default_node_pool {
  name            = each.value.default_node_pool.name
  node_count      = each.value.default_node_pool.node_count
  vm_size         = each.value.default_node_pool.vm_size
  vnet_subnet_id  = var.aks_subnet_id
}
  identity {
    type = each.value.identity_type
  }

  network_profile {
  network_plugin      = "azure"
  network_plugin_mode = "overlay"

  pod_cidr       = "192.168.0.0/16"
  service_cidr   = "10.200.0.0/16"
  dns_service_ip = "10.200.0.10"
}

  tags = each.value.tags
}