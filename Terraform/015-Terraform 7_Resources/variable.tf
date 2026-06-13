variable "rg_names" {
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
    name =  string
    vnet_key =  string
    rg_key = string
    address_prefixes = list(string)

    }))  
}