variable "rg_name" {
    type = map(string)
    default = {
        "dev" = "rg-dev"
        "prod" = "rg-prod"
    }
}


# resource group using map of string

resource "azurerm_resource_group" "rg" {
    for_each = var.rg_name
    name     = each.value
    location = "eastus"
}