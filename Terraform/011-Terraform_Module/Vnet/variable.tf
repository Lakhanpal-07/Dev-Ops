variable "rg_nsg_vnet" {
  type = map(object({
    name     = string
    location = string

    network_security_group = object({
      name = string
    })

    virtual_network = object({
      name          = string
      address_space = list(string)
    })

    subnet1 = object({
      name           = string
      address_prefix = list(string)
    })

    subnet2 = object({
      name           = string
      address_prefix = list(string)
    })
  }))
}
