variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "nsgs" {
  description = "Map of NSGs with rules"
  type = map(object({
    rules = list(object({
      name     = string
      port     = number
      priority = number
    }))
  }))
}
