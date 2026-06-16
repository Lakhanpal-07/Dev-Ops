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
