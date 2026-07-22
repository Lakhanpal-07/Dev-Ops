rg_name = {
  rg1 = {
    name     = "rg-dev-01"
    location = "Central India"
  }
}

# storage account with container stoarge.

stg0101 = {
  stg01 = {
    name                     = "stgdev7867654my090801"
    resource_group_name      = "rg-dev-01"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    storage_container_name   = "container-dev-01"
    container_access_type    = "private"
  }
}

# virtual network configured

vnets = {
  vnet01 = {
    name                = "vnet-dev-01"
    address_space       = ["10.123.0.0/16"]
    resource_group_name = "rg-dev-01"
    location            = "Central India"
  }
  vnet02 = {
    name                = "vnet-dev-02"
    address_space       = ["10.124.0.0/16"]
    resource_group_name = "rg-dev-01"
    location            = "Central India"
  }
}

# subnets definiation in vnet01

subnets = {
  frontend_subnet = {
    name                 = "frontend-subnet"
    address_prefix       = ["10.123.1.0/24"]
    virtual_network_name = "vnet-dev-01"
    resource_group_name  = "rg-dev-01"
  }
  backend_subnet = {
    name                 = "backend-subnet"
    address_prefix       = ["10.123.2.0/24"]
    virtual_network_name = "vnet-dev-01"
    resource_group_name  = "rg-dev-01"
  }
  AzureBastionSubnet = {
    name                 = "AzureBastionSubnet"
    address_prefix       = ["10.123.3.0/24"]
    virtual_network_name = "vnet-dev-01"
    resource_group_name  = "rg-dev-01"
  }
}

# public IP attached

public_ip_map = {
  frontend_ip = {
    name                = "pip_frontend"
    resource_group_name = "rg-dev-01"
    location            = "Central India"
    allocation_method   = "Static"
  }
  # backend_ip = {
  #   name                = "pip_backend"
  #   resource_group_name = "rg-dev-01"
  #   location            = "Central India"
  #   allocation_method   = "Static"
  # }
  Bastion_ip = {
    name                = "pip_Bastion"
    resource_group_name = "rg-dev-01"
    location            = "Central India"
    allocation_method   = "Static"
  }

  # nat_ip = {
  #   name                = "pip_nat"
  #   resource_group_name = "rg-dev-01"
  #   location            = "Central India"
  #   allocation_method   = "Static"
  # }

  # lb_ip = {
  #   name                = "pip_lb"
  #   resource_group_name = "rg-dev-01"
  #   location            = "Central India"
  #   allocation_method   = "Static"
  # }
  # appgw_ip = {
  #   name                = "pip_appgw"
  #   resource_group_name = "rg-dev-01"
  #   location            = "Central India"
  #   allocation_method   = "Static"
  # }
}


# nic card attached to Front_end & back_end Subnets

nic_map = {
  frontend_nic = {
    name                 = "frontend_nic"
    location             = "Central India"
    resource_group_name  = "rg-dev-01"
    virtual_network_name = "vnet-dev-01"
    subnet_name          = "frontend-subnet"
    public_ip_name       = "pip_frontend"
    ip_config_name       = "frontend_ip_config"
    ip_config_allocation = "Dynamic"
  }
  # backend_nic = {
  #   name                 = "backend_nic"
  #   location             = "Central India"
  #   resource_group_name  = "rg-dev-01"
  #   virtual_network_name = "vnet-dev-01"
  #   subnet_name          = "backend-subnet"
  #   public_ip_name       = "pip_backend"
  #   ip_config_name       = "backend_ip_config"
  #   ip_config_allocation = "Dynamic"
  # }
}

# Azure_Bastion-Host configuration

Bastion_host = {
  Bastion-host = {
    name                 = "Bastion-host"
    location             = "Central India"
    resource_group_name  = "rg-dev-01"
    virtual_network_name = "vnet-dev-01"
    subnet_name          = "AzureBastionSubnet"
    ip_config_name       = "Bastion-ip_config"
    public_ip_name       = "pip_Bastion"
  }
}


# nsg_map = {
#   frontend-nsg = {
#     name                = "frontend-nsg"
#     location            = "Central India"
#     resource_group_name = "rg-dev-01"
#     rules = [
#       {
#         name                       = "AllowHTTP"
#         priority                   = 100
#         direction                  = "Inbound"
#         access                     = "Allow"
#         protocol                   = "Tcp"
#         destination_port_range     = "80"
#         source_port_range          = "*"
#         source_address_prefix      = "*"
#         destination_address_prefix = "*"
#       }
#     ]
#   }

#   backend-nsg = {
#     name                = "backend-nsg"
#     location            = "Central India"
#     resource_group_name = "rg-dev-01"
#     rules = [
#       {
#         name                       = "AllowSQL"
#         priority                   = 200
#         direction                  = "Inbound"
#         access                     = "Allow"
#         protocol                   = "Tcp"
#         destination_port_range     = "1433"
#         source_port_range          = "*"
#         source_address_prefix      = "*"
#         destination_address_prefix = "*"
#       }
#     ]
#   }

#   admin-nsg = {
#     name                = "admin-nsg"
#     location            = "Central India"
#     resource_group_name = "rg-dev-01"
#     rules = [
#       {
#         name                       = "AllowSSH"
#         priority                   = 300
#         direction                  = "Inbound"
#         access                     = "Allow"
#         protocol                   = "Tcp"
#         destination_port_range     = "22"
#         source_port_range          = "*"
#         source_address_prefix      = "*"
#         destination_address_prefix = "*"
#       },
#       {
#         name                       = "AllowRDP"
#         priority                   = 310
#         direction                  = "Inbound"
#         access                     = "Allow"
#         protocol                   = "Tcp"
#         destination_port_range     = "3389"
#         source_port_range          = "*"
#         source_address_prefix      = "*"
#         destination_address_prefix = "*"
#       }
#     ]
#   }
# }

# nat = {
#   nat1 = {
#     name                = "nat_vnet-dev-01"
#     location            = "Central India"
#     resource_group_name = "rg-dev-01"
#     sku_name            = "Standard"
#     pip_name            = "pip_nat"
#     vnet_name           = "vnet-dev-01"
#     subnet_name         = "frontend-subnet"

#   }
# }

vm_map = {
  linux_vm = {
    name                = "mylinux-vm"
    resource_group_name = "rg-dev-01"
    location            = "Central India"
    size                = "Standard_D4_v5"
    nic_name            = "frontend_nic"
    admin_username      = "Devops"
    admin_password      = "devops@12345"
    # network_security_group_name = "frontend-nsg"  # optional to attached with either subnet of vm depending upon vm number or security type
    # public_key                  = file("~/.ssh/id_rsa.pub")

    disk_name            = "frontend-osdisk"
    disk_caching         = "ReadWrite"
    storage_account_type = "Standard_LRS"

    source_image_reference_publisher = "Canonical"
    source_image_reference_offer     = "UbuntuServer"
    source_image_reference_sku       = "16.04.0-LTS"
    source_image_reference_version   = "latest"
  }
}
