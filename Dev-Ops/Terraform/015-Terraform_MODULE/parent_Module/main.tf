module "resource_group" {
  source = "../..Child_Mod/resource_group"

  rgs = {
    rg1 = {
      name     = "rg1"
      location = "East US"
    }
    rg2 = {
      name     = "rg2"
      location = "West US"
    }
  }
}

module "virtual_network" {
  source = "../..Child_Mod/virtual_network"

  vnets = {
    vnet1 = {
      name          = "vnet1"
      address_space = "10.123.0.0/16"
      rg_name       = "rg1"
      location      = "East US"
    }
    vnet2 = {
      name          = "vnet2"
      address_space = "10.124.0.0/16"
      rg_name       = "rg2"
      location      = "West US"
    }
  }
}