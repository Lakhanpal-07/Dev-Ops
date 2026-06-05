variable "mystg" {
 type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    account_tier        = string
    account_replication_type = string
  }))

  default = {
    "stg01" = {
        name = "mystg01"
        resource_group_name = "myrg01"  
        location = "eastus"
        account_tier = "Standard"
        account_replication_type = "LRS"
             
    }
  }
}