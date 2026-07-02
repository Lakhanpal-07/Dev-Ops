
# variable declation for toset function

variable "rg_names" {
    type = list(string)
    
}


# resource group with toset function

resource "azurerm_resource_group" "rg_names" {
for_each = toset(var.rg_names)
  
  name = each.key
  location = "eastus"
}