# Terraform `depends_on` Meta-Argument with Azure Storage Example

This document explains the Terraform `depends_on` meta-argument using a simple Azure example with one resource group and one storage account. The `depends_on` meta-argument is used to declare an explicit dependency when Terraform cannot infer that relationship automatically from resource arguments.

## Example code

```hcl
resource "azurerm_resource_group" "rg03" {
  name     = "rg03"
  location = "eastus"
}

resource "azurerm_storage_account" "stg02" {
  depends_on               = [azurerm_resource_group.rg03]
  name                     = "stg02"
  resource_group_name      = azurerm_resource_group.rg03.name
  location                 = azurerm_resource_group.rg03.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
}
```

## What `depends_on` means

`depends_on` is a Terraform meta-argument available in resource and module blocks, and it tells Terraform to complete actions on one object before processing another object. In this example, it tells Terraform to finish the resource group before creating the storage account.

## Is it correct in this code?

Yes, this usage is syntactically correct because `depends_on` accepts a list of references to resources in the same module. The dependency reference `azurerm_resource_group.rg03` is valid, so Terraform will respect that order during planning and apply.

## Is it required here?

In this particular code, `depends_on` is not required because Terraform can already infer the dependency from `resource_group_name = azurerm_resource_group.rg03.name` and `location = azurerm_resource_group.rg03.location`. HashiCorp recommends using direct expression references whenever possible and treating `depends_on` as a last resort for hidden dependencies.

## Why implicit dependency already works

Terraform builds a dependency graph by analyzing references between resources. Because the storage account reads values from the resource group, Terraform already knows that the resource group must exist first.

## Practice takeaway

For practice, this example shows the right concept: a storage account belongs to a resource group, and Terraform should create the resource group first. Keeping `depends_on` here is acceptable while learning, but the cleaner production-style version would remove it and rely on the resource references instead.


## Notes for practice

The storage account name `stg02` is fine for learning syntax, but Azure storage account names must follow naming restrictions and be globally unique in real deployments. For concept practice, the key thing is understanding resource references and the difference between implicit and explicit dependencies.