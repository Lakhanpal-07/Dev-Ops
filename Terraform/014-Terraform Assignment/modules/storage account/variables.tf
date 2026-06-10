variable "stg" {

  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    account_tier             = string
    account_replication_type = string
    account_kind             = string
    access_tier              = string
  }))
}

