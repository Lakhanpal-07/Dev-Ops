# modules of root

module "resource_group" {
  source = "../../modules/resource_group"
  rgs    = var.rg_name
}

module "storage_account" {
  depends_on = [module.resource_group]
  source     = "../../modules/storage_account"
  mystg01    = var.stg0101

}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/virtual_network"
  vnets      = var.vnets
}
module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/sub_net"
  subnets    = var.subnets
}

module "public_ip" {
  depends_on      = [module.resource_group]
  source          = "../../modules/Pub_IP"
  public_ip_names = var.public_ip_map
}

module "network_interface_card" {
  depends_on = [module.resource_group, module.virtual_network, module.subnet, module.public_ip]
  source     = "../../modules/Network_Interface_card"
  nic        = var.nic_map
}
module "Azure_Bastion" {
  depends_on = [module.resource_group, module.virtual_network, module.subnet, module.public_ip]
  source     = "../../modules/Azure_Bastion"
  Bastion    = var.Bastion_host
}

# module "network_security_group" {
#   depends_on = [module.resource_group, module.virtual_network, module.subnet]
#   source     = "../../modules/NSG"
#   nsg        = var.nsg_map
# }

module "vm_linux" {
  depends_on = [module.resource_group, module.virtual_network, module.subnet, module.network_interface_card]

  source   = "../../modules/virtual-machine"
  vm_linux = var.vm_map
}
