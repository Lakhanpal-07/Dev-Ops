#   variable in terraform

variable "rg" {
  type    = string
  default = "rg001"
}
variable "location" {
  type    = string
  default = "eastus"
}
resource "azurerm_resource_group" "rg_name" {
  name     = var.rg
  location = var.location

}

