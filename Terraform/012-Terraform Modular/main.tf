# module "resource_group" {
#   source = "./modules/resource_group"

#   name     = "rg-terraform-nested-map"
#   location = "eastus"
# }


module "storage_account" {
  source = "./modules/storage_account"

  mystg = {
    "stg01" = {
      name                     = "mystg01"
      resource_group_name      = module.resource_group.name
      location                 = module.resource_group.location
      account_tier             = "Standard"
      account_replication_type = "LRS"

    }
  }
}
