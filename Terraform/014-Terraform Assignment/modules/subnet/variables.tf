variable "subnets" {
  type = map(object({
    subnet_name          = string
    address_prefix       = list(string)
    virtual_network_name = string
    resource_group_name  = string
  }))
}
