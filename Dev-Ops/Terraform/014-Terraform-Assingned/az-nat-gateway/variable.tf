variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "name" {
  description = "NAT Gateway name"
  type        = string
}

variable "public_ip_id" {
  description = "ID of the Public IP to associate"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to attach NAT Gateway"
  type        = string
}
