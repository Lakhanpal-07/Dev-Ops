variable "rgs" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnets" {
  type = map(object({
    name          = string
    address_space = list(string)
    rg_key        = string
  }))
}

variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
    vnet_key         = string
    rg_key           = string
  }))
}

variable "nsgs" {
  type = map(object({
    name   = string
    rg_key = string
    rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "vms" {
  type = map(object({
    name           = string
    rg_key         = string
    subnet_key     = string
    size           = string
    admin_username = string
    admin_password = string
  }))
}

variable "peerings" {
  type = map(object({
    name            = string
    rg_key          = string
    vnet_key        = string
    remote_vnet_key = string
  }))
}

variable "bastions" {
  type = map(object({
    name       = string
    rg_key     = string
    subnet_key = string
  }))
}
