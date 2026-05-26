resource "azurerm_resource_group" "rg_tf" {

  name     = "rg001"
  location = "westus"
}
resource "azurerm_network_security_group" "nsg" {

  name                = "nsg01"
  location            = azurerm_resource_group.rg_tf.location
  resource_group_name = azurerm_resource_group.rg_tf.name
}

resource "azurerm_virtual_network" "vnet" {

  name                = "rg01_vnet"
  location            = azurerm_resource_group.rg_tf.location
  resource_group_name = azurerm_resource_group.rg_tf.name
  address_space       = ["10.0.0.1/16"]
  dns_servers          = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "frontend_subnet"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet {
    name           = "backend_subnet"
    address_prefixes = ["10.0.2.0/24"]
  }
}
