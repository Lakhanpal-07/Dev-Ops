variable "location" { type = string }
variable "rg_name" { type = string }

variable "vnet_name" { type = string }
variable "address_space" { type = list(string) }
variable "subnets" { type = map(string) }

variable "nsgs" {
  type = map(object({
    rules = list(object({
      name     = string
      port     = number
      priority = number
    }))
  }))
}

variable "public_ips" {
  type = map(string)
}

variable "nat_gateway_name" { type = string }
variable "bastion_name" { type = string }
variable "bastion_public_ip_name" { type = string }
variable "lb_name" { type = string }
variable "lb_public_ip_name" { type = string }

variable "vms" {
  type = map(object({
    subnet = string
    nsg    = string
    image  = string
    size   = string
  }))
}
