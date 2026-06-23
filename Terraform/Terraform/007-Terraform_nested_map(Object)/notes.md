# Terraform `map(object)` Example

This example shows how to use a Terraform variable of type `map(object(...))` to create Azure Resource Groups and Azure Storage Accounts from one structured input variable.

## What `map(object)` means

A `map(object(...))` stores key-value pairs where each key maps to a structured object instead of a single string.
This is useful when each item needs multiple attributes such as `name`, `location`, `tags`, and a nested `storage_account` configuration.

## Example code

```hcl
variable "rg_stg_map" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
    storage_account = object({
      name                     = string
      account_tier             = string
      account_replication_type = string
      account_kind             = string
      access_tier              = string
    })
  }))
}

resource "azurerm_resource_group" "rg" {
  for_each = var.rg_stg_map

  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}

resource "azurerm_storage_account" "stg" {
  for_each = var.rg_stg_map

  name                     = each.value.storage_account.name
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = azurerm_resource_group.rg[each.key].location
  account_tier             = each.value.storage_account.account_tier
  account_replication_type = each.value.storage_account.account_replication_type
  account_kind             = each.value.storage_account.account_kind
  access_tier              = each.value.storage_account.access_tier
}
```

## How it works

Terraform uses `for_each = var.rg_stg_map` to loop through every item in the map and create one Resource Group and one Storage Account for each key.
For each item, `each.key` is the current map key such as `app1`, and `each.value` is the full object attached to that key.

## Nested object access

The Resource Group reads values directly from the top-level object by using `each.value.name`, `each.value.location`, and `each.value.tags`.
The Storage Account settings come from the nested object, so they are accessed through `each.value.storage_account.<field>`.

## Why `resource_group_name` is written this way

The line `resource_group_name = azurerm_resource_group.rg[each.key].name` connects each storage account to the matching Resource Group instance created with the same `for_each` key.
This works because resources created with `for_each` are addressed by their key, such as `azurerm_resource_group.rg["app1"].name`.

## When to use `map(object)`

Use `map(object(...))` when one item needs multiple related values instead of just one string.
Typical use cases include Resource Groups with tags, storage settings, subnet definitions, VM configuration, or any reusable Azure deployment pattern with grouped attributes.

## Compare with `map(string)`

A `map(string)` is best when each key holds only one value, such as `dev = "rg-dev"`.
A `map(object(...))` is better when each key needs several fields and nested settings.
