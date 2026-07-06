variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "name" {
  description = "Load Balancer name"
  type        = string
}

variable "public_ip_name" {
  description = "Public IP name for LB frontend"
  type        = string
}

variable "backend_vms" {
  description = "List of NIC IDs for backend VMs"
  type        = list(string)
}
