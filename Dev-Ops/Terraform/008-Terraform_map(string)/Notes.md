# Terraform `map(string)` Example

This example shows how to use a Terraform variable of type `map(string)` to create multiple Azure Resource Groups with `for_each`.

## What `map(string)` means

A `map(string)` stores key-value pairs where each key maps to a single string value.
In this example, the keys are environment names like `dev` and `prod`, and the values are the Resource Group names.

## Example code

```hcl
variable "rg_name" {
  type = map(string)
  default = {
    dev  = "rg-dev"
    prod = "rg-prod"
  }
}

resource "azurerm_resource_group" "rg" {
  for_each = var.rg_name

  name     = each.value
  location = "eastus"
}
```

## How it works

Terraform loops over each entry in `var.rg_name` by using `for_each` with the map.
For each item, `each.key` gives the map key such as `dev` or `prod`, and `each.value` gives the corresponding Resource Group name such as `rg-dev` or `rg-prod`.
## What gets created

With the default values shown above, Terraform creates two Resource Groups:

- `rg-dev`
- `rg-prod`

Both will be created in the `eastus` region because `location` is hardcoded in the resource block.
