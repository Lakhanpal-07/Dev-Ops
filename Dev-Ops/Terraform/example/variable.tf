variable "rg_names" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))

}

variable "ymstg01" {
  type = map(object({
    name                     = string
    location                 = string
    rg_key                   = string
    account_tier             = string
    account_replication_type = string
    account_kind             = string
    access_tier              = string

  }))

}

