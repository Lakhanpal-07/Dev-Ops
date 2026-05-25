# Terraform `toset()` Example

This example shows how to convert a `list(string)` into a set using `toset()` and then create Azure Resource Groups with `for_each`.

## What `toset()` does

`toset()` converts a list into a set of unique values.
In Terraform, `for_each` works with a map or a set of strings, so `toset()` is useful when your input starts as a list.

## Example code

```hcl
variable "rg_names" {
  type    = list(string)
  default = ["rg001", "rg002", "rg003"]
}

resource "azurerm_resource_group" "rg_names" {
  for_each = toset(var.rg_names)

  name     = each.value
  location = "eastus"
}
```

## How it works

`var.rg_names` is a list of strings, and `toset(var.rg_names)` turns it into a set so `for_each` can loop over it. 
With a set of strings, `each.key` and `each.value` are the same value, so `each.value` is usually the clearest choice for the resource name. 

## What gets created

With the default values above, Terraform creates three Azure Resource Groups: `rg001`, `rg002`, and `rg003`.
All of them will be deployed in `eastus` because the location is fixed in the resource block. 

## Why use `toset()`

Use `toset()` when you want a simple list to work with `for_each` and you do not need list ordering. 
Sets remove duplicates, so if the list contains repeated values, Terraform keeps only one of each unique item.

## Small note

`for_each` is generally better than `count` when you want stable resource addresses based on names instead of list indexes.