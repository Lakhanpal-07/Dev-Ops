rgs = {
  "rg1" = { name = "rg-dev-01", location = "East US" }
  "rg2" = { name = "rg-dev-02", location = "West US" }
}

vnets = {
  "vnet1" = { name = "vnet-hub", address_space = ["10.0.0.0/16"], rg_key = "rg1" }
  "vnet2" = { name = "vnet-spoke", address_space = ["10.1.0.0/16"], rg_key = "rg2" }
}

subnets = {
  "snet-hub-bastion" = { name = "AzureBastionSubnet", address_prefixes = ["10.0.1.0/24"], vnet_key = "vnet1", rg_key = "rg1" }
  "snet-spoke-workload" = { name = "snet-workload", address_prefixes = ["10.1.1.0/24"], vnet_key = "vnet2", rg_key = "rg2" }
}

nsgs = {
  "nsg1" = {
    name   = "nsg-workload"
    rg_key = "rg2"
    rules = [
      {
        name                       = "SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

vms = {
  "vm1" = {
    name           = "vm-workload-01"
    rg_key         = "rg2"
    subnet_key     = "snet-spoke-workload"
    size           = "Standard_DS1_v2"
    admin_username = "azureuser"
    admin_password = "Password1234!"
  }
}

peerings = {
  "hub-to-spoke" = {
    name            = "peering-hub-to-spoke"
    rg_key          = "rg1"
    vnet_key        = "vnet1"
    remote_vnet_key = "vnet2"
  }
  "spoke-to-hub" = {
    name            = "peering-spoke-to-hub"
    rg_key          = "rg2"
    vnet_key        = "vnet2"
    remote_vnet_key = "vnet1"
  }
}

bastions = {
  "bastion1" = {
    name       = "bastion-hub"
    rg_key     = "rg1"
    subnet_key = "snet-hub-bastion"
  }
}
