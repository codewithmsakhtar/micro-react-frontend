variable "vnets" {
  type = map(object({
    virtual_network_name = string
    resource_group_name  = string
    location             = string
    address_space        = list(string)

    tags = optional(map(string), {})
  }))
}