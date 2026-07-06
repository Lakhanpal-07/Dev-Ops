variable "vnets" {
  type = map(object({
    name          = string
    address_space = string
    resource_group_name = string
    location      = string
  }))
}
