#   resource group for the project

resource "azurerm_resource_group" "rg01" {
  name     = "rg01"
  location = "eastus"
}
