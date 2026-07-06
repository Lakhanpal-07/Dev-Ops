variable "rgs" {
  type = map(object({
    name     = string
    location = string
  })) 
}


resource "azurerm_resource_group" "rg_tf" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location

}
