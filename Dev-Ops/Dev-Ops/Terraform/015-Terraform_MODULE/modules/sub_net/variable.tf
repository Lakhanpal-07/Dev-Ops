variable "subnets" {
  type = map(object({
    name          = string
    address_prefix = list(string)
    virtual_network_name = string
    resource_group_name  = string
  }))
}
