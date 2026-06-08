variable "rgs" {
  description = "Map of resource groups"
  type = map(object({
    name     = string
    location = string
  }))
}
