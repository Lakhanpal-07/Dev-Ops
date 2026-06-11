variable "nsg" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    security_rules = list(object({
      name                   = string
      priority               = number
      direction              = string
      access                 = string
      protocol               = string
      destination_port_range = string

    }))
  }))

}
