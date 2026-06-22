variable "aks_clusters" {
  type = map(object({
    aks_name            = string
    resource_group_name = string
    location            = string
    dns_prefix          = string

    default_node_pool = object({
      name       = string
      node_count = number
      vm_size    = string
    })

    identity_type = optional(string, "SystemAssigned")
    tags          = optional(map(string), {})
  }))
}

variable "aks_subnet_id" {
  type = string
}