all = {
  rgname = {

    rg1 = {
      name     = "rg-801"
      location = "westus"
    }
    rg2 = {
      name     = "rg-802"
      location = "Central India"
    }
  }

  vnets = {
    vnet1 = {
      vnet_name     = "vnet-801"
      rg_key        = "rg1"
      address_space = ["10.132.0.0/16"]
    }
    vnet2 = {
      vnet_name     = "vnet-802"
      rg_key        = "rg2"
      address_space = ["10.122.0.0/16"]
    }
  }

  subnets = {

    subnet1 = {
      subnet_name = "subnet_801"
      rg_key      = "rg1"
      vnet_key    = "vnet1"
      ap          = ["10.132.1.0/24"]
    }

    subnet3 = {
      subnet_name = "AzureBastionSubnet"
      rg_key      = "rg1"
      vnet_key    = "vnet1"
      ap          = ["10.132.3.0/28"]
    }

    subnet2 = {
      subnet_name = "subnet_802"
      rg_key      = "rg2"
      vnet_key    = "vnet2"
      ap          = ["10.122.2.0/24"]
    }

    subnet4 = {
      subnet_name = "AzureBastionSubnet"
      rg_key      = "rg2"
      vnet_key    = "vnet2"
      ap          = ["10.122.4.0/28"]
    }
  }

  vnet_peering = {
    peering1 = {

      name            = "peer801to802"
      rg_key          = "rg1"
      source_vnet_key = "vnet1"
      remote_vnet_key = "vnet2"
    }

    peering2 = {

      name            = "peer802to801"
      rg_key          = "rg2"
      source_vnet_key = "vnet2"
      remote_vnet_key = "vnet1"
    }

  }

  nsgs = {
    nsg1 = {
      name   = "NSG-801"
      rg_key = "rg1"

      security_rule = {
        name                       = "SSHAndHTTP-801"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges    = ["22", "80", "3389"]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }

    nsg2 = {
      name   = "NSG-802"
      rg_key = "rg2"

      security_rule = {
        name                       = "SSHAndHTTP-802"
        priority                   = 210
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges    = ["22", "80", "3389"]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }

  nics = {
    nic1 = {
      name                          = "nic-801"
      rg_key                        = "rg1"
      ip_name                       = "ip-801"
      subnet_key                    = "subnet1"
      private_ip_address_allocation = "Dynamic"
      
    }

    nic2 = {
      name                          = "nic-802"
      rg_key                        = "rg2"
      ip_name                       = "ip-802"
      subnet_key                    = "subnet2"
      private_ip_address_allocation = "Dynamic"
      

    }
  }

  ipconfigs = {
    ipconfig1 = {
      name              = "ip-801"
      rg_key            = "rg1"
      allocation_method = "Static"
      sku               = "Standard"
    }

    ipconfig2 = {
      name              = "ip-802"
      rg_key            = "rg2"
      allocation_method = "Static"
      sku               = "Standard"
    }
  }
  nic_nsg_asscn = {
    nicnsgasscn1 = {

      nic_key = "nic1"
      nsg_key = "nsg1"
    }

    nicnsgasscn2 = {

      nic_key = "nic2"
      nsg_key = "nsg2"
    }
  }


bsns = {
  bsn1 = {
    name                = "bsn-801"
    resource_group_name = "rg-801"
    location            = "westus"
     sku = "Standard"
    
    ip_configuration = {
      name                 = "ipconfig-801"
      subnet_key                    = "subnet3"
      public_ip_key                 = "ipconfig1"
      
    }
  }

  bsn2 = {
    name                = "bsn-802"
    resource_group_name = "rg-802"
    location            = "central india"
     sku = "Standard"

    ip_configuration = {
      name                 = "ipconfig-802"
      subnet_key                    = "subnet4"
      public_ip_key                 = "ipconfig2"
    }
  }
}


  vm_linux = {
    vm_linux_frontend = {
      vm_name                 = "vm-frontend-801"
      rg_name                 = "rg-801"
      location                = "westus"
      to_be_attach_nic_id_key = "nic1"
      vm_size                 = "Standard_D2S_v3"

      storage_image_reference = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }


      storage_os_disk = {
        name              = "osdisk-801"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
      }

      os_profile = {
        computer_name  = "Frontend-Ubuntu"
        admin_username = "devopsadmin"
        admin_password = "Devops@12345"
      }
    }
  }
}
