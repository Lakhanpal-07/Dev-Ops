variable "stgs" {

  type = map(object({

    name                     = string
    location                 = string
    resource_group_name      = string
    account_tier             = String
    account_replication_type = String
    account_kind             = String
    access_tier              = String
  }))
}
