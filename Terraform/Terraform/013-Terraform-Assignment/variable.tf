variable "rg_name" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnets" {
  type = map(object({
    name          = string
    location      = string
    rg_key        = string
    address_space = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
    rg_key           = string
    vnet_key         = string

  }))
}

# variable "nsg" {
#   type = map(object({
#     name           = string
#     location       = string
#     rg_key         = string
#     security_rule  = map(object({
#       name                   = string
#       priority               = number
#       direction              = string
#       access                 = string
#       protocol               = string
#       destination_port_range = number
#     }))
#   }))
# }
