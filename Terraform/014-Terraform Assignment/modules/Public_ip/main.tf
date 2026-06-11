variable "public_ip_name" {
  
  type        = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
  }))  
}


resource "azurerm_public_ip" "example" {
  for_each            = var.public_ip_name
  name                =each.value.name
  resource_group_name = each.value.resource_group_name  
  location            = each.value.location
  allocation_method   = each.value.allocation_method

}