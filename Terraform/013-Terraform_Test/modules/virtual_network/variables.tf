variable "vnets" {
  description = "Map of virtual networks"
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
  }))
}
