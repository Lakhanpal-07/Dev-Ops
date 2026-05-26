

resource "azurerm_resource_group" "rg_tf" {

  name     = "rg001"
  location = "westus"
}
resource "azurerm_network_security_group" "nsg" {

  name                = "nsg01"
  location            = azurerm_resource_group.rg_tf.location
  resource_group_name = azurerm_resource_group.rg_tf.name
}
