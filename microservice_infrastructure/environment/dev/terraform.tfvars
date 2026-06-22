# ==========================
# Resource Groups
# ==========================

rgs = {
  rg1 = {
    resource_group_name = "rg-dev"
    location            = "Central India"

    tags = {
      environment = "dev"
      project     = "aks-demo"
    }
  }
}

# ==========================
# Virtual Networks
# ==========================

vnets = {
  vnet1 = {
    virtual_network_name = "dev-vnet"
    resource_group_name  = "rg-dev"
    location             = "Central India"

    address_space = [
      "10.0.0.0/16"
    ]

    tags = {
      environment = "dev"
    }
  }
}

# ==========================
# Subnets
# ==========================

subnets = {
  aks_subnet = {
    subnet_name          = "aks-subnet"
    resource_group_name  = "rg-dev"
    virtual_network_name = "dev-vnet"

    address_prefixes = [
      "10.0.1.0/24"
    ]
  }

}

# ==========================
# Azure Container Registry
# ==========================

acrs = {
  acr1 = {
    acr_name            = "shahtechacr001"   # Globally unique hona chahiye
    resource_group_name = "rg-dev"
    location            = "Central India"

    sku            = "Basic"
    admin_enabled  = true

    tags = {
      environment = "dev"
    }
  }
}

# ==========================
# AKS Cluster
# ==========================

aks_clusters = {
  aks1 = {

    aks_name            = "aks-dev"
    resource_group_name = "rg-dev"
    location            = "Central India"
    dns_prefix          = "aksdev"

    sku_tier = "Free"

    default_node_pool = {
      name       = "system"
      node_count = 1
      vm_size    = "Standard_B2s"
    }

    identity_type = "SystemAssigned"

    tags = {
      environment = "dev"
    }
  }
}