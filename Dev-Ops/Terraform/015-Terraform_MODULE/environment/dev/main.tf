module "resource_group" {
    source = "../../modules/resource_group"
    rgs = var.rg_name
}

module "storage_account" {
    depends_on = [module.resource_group]
    source = "../../modules/storage_account"
    mystg01 = var.stg0101
    
}
module "virtual_network" {
    depends_on = [module.resource_group]
    source = "../../modules/virtual_network"
    vnets = var.vnet0101
}
 module "subnet" {
    depends_on = [module.virtual_network]
    source = "../../modules/sub_net"
    subnets = var.subnets
 }