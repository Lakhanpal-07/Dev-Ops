variable "bastions" {
  description = "Map of Bastion hosts"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_id           = string
  }))
}
