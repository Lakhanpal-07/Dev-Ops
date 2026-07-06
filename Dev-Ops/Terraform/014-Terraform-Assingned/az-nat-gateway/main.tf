resource "azurerm_nat_gateway" "nat" {
  name                = var.name
  location            = var.location
  resource_group_name = var.rg_name
  sku_name            = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "assoc" {
  nat_gateway_id       = azurerm_nat_gateway.nat.id
  public_ip_address_id = var.public_ip_id
}

resource "azurerm_subnet_nat_gateway_association" "subnet_assoc" {
  subnet_id      = var.subnet_id
  nat_gateway_id = azurerm_nat_gateway.nat.id
}
