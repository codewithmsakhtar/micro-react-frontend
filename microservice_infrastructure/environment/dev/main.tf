module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "vnet" {
    depends_on = [ module.resource_group ]
  source = "../../modules/azurerm_virtual_network"
  vnets  = var.vnets
}

module "subnet" {
    depends_on = [ module.vnet ]
  source  = "../../modules/azurerm_subnets"
  subnets = var.subnets
}

module "acr" {
  source = "../../modules/azurerm_container_registry"
  acrs   = var.acrs
}

module "aks" {
    depends_on = [ module.subnet ]
  source       = "../../modules/azurerm_kubernetes_cluster"
  aks_clusters = var.aks_clusters
 aks_subnet_id = module.subnet.subnet_ids["aks_subnet"]
}