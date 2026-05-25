# Terraform Variables

This example shows how to define simple input variables in Terraform and use them to create an Azure Resource Group.

## Example code

```hcl
variable "rg" {
  type    = string
  default = "rg001"
}

variable "location" {
  type    = string
  default = "eastus"
}

resource "azurerm_resource_group" "rg_name" {
  name     = var.rg
  location = var.location
}
```

## How this works

- `variable "rg"` stores the resource group name as a string.
- `variable "location"` stores the Azure region as a string.
- `var.rg` and `var.location` are used inside the resource block.

## Terraform variable types

| Type | Meaning | Example |
|---|---|---|
| `string` | Text value | `"rg001"` |
| `number` | Numeric value | `10` |
| `bool` | True or false | `true` |
| `list(type)` | Ordered values of the same type | `["eastus", "westus"]` |
| `set(type)` | Unordered unique values | `toset(["a", "b"])` |
| `map(type)` | Key-value pairs with the same value type | `{ dev = "rg-dev", prod = "rg-prod" }` |
| `object({...})` | Named attributes with different types | `{ name = "rg01", location = "eastus" }` |
| `tuple([...])` | Fixed ordered values, different types allowed | `["rg01", 1, true]` |

## Singular vs plural view

| Category | Types |
|---|---|
| Singular | `string`, `number`, `bool` |
| Plural / collection | `list`, `set`, `map`, `object`, `tuple` |

## When to use each type

- Use `string` for one text value.
- Use `number` for ports, counts, sizes, or timeouts.
- Use `bool` for enable/disable flags.
- Use `list(string)` when order matters.
- Use `set(string)` when duplicates should be removed.
- Use `map(string)` when each key has one string value.
- Use `object({...})` when each item has multiple named fields.
- Use `tuple([...])` when values are fixed in order and may have different types.

## Examples

### String
```hcl
variable "env" {
  type    = string
  default = "dev"
}
```

### Number
```hcl
variable "port" {
  type    = number
  default = 80
}
```

### Bool
```hcl
variable "enabled" {
  type    = bool
  default = true
}
```

### List
```hcl
variable "regions" {
  type    = list(string)
  default = ["eastus", "westus"]
}
```

### Set
```hcl
variable "names" {
  type    = set(string)
  default = ["rg001", "rg002", "rg002"]
}
```

### Map
```hcl
variable "rg_name" {
  type = map(string)
  default = {
    dev  = "rg-dev"
    prod = "rg-prod"
  }
}
```

### Object
```hcl
variable "rg_details" {
  type = object({
    name     = string
    location = string
    tags     = map(string)
  })
}
```

### Tuple
```hcl
variable "mixed_values" {
  type    = tuple([string, number, bool])
  default = ["rg001", 3, true]
}

