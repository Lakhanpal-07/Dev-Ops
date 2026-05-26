


resource "azurerm_virtual_network" "vnet" {
  name                = "vnet01"
  location            = data.terraform_remote_state.rg.output.rg_location
  resource_group_name = data.terraform_remote_state.output.rg_name
  address_space       = ["10.0.0.0/16"]
}
