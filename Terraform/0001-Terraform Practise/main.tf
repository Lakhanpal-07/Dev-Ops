
# Variable assignment using terraform collection type string.

resource "azurerm_resource_group" "rg01" {
  name     = var.rg_string
  location = var.location
}

# Variable assignment using terraform collection type set(string)

resource "azurerm_resource_group" "rg03" {

  for_each = toset(var.rg_set)
  name     = each.value
  location = "westus"
}

# Variable assignment using terraform collection type map(string)

resource "azurerm_resource_group" "rg02" {
  for_each = var.rg_map
  name     = each.value.name
  location = each.value.location
}

# Variable assignment using terraform collection type map(object)

resource "azurerm_resource_group" "rg_map" {
  for_each = var.rg_name_map
  name     = each.value.name
  location = each.value.location
}

resource "azurerm_resource_group" "rg_list" {
  for_each = var.rg_name_map
  name     = each.value.name
  location = each.value.location
}

