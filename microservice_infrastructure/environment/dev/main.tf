module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "vnet" {
  source = "../../modules/azurerm_virtual_network"
  vnets  = var.vnets
}

module "subnet" {
  source  = "../../modules/azurerm_subnet"
  subnets = var.subnets
}

module "acr" {
  source = "../../modules/azurerm_container_registry"
  acrs   = var.acrs
}

module "aks" {
  source       = "../../modules/azurerm_kubernetes_cluster"
  aks_clusters = var.aks_clusters
}