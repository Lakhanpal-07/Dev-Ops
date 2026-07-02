# Azure Resource Group and Storage Account Using Terraform

This project uses Terraform to create a basic Azure Resource Group and an Azure Storage Account.

It is a simple practice project for learning how Terraform handles Azure resources and dependencies. The storage account is created inside the resource group by referencing the resource group's name and location directly in the Terraform configuration. 

## Resources Created

| Resource Type | Terraform Name | Description |
|---|---|---|
| Resource Group | `azurerm_resource_group.rg02` | Creates the Azure resource group |
| Storage Account | `azurerm_storage_account.stg02` | Creates the Azure storage account inside the resource group |

## Terraform Code

```hcl
# resource group for storage account

resource "azurerm_resource_group" "rg02" {
  name     = "rg02"
  location = "eastus"
}

# storage account for the project

resource "azurerm_storage_account" "stg02" {
  name                     = "stg02"
  resource_group_name      = azurerm_resource_group.rg02.name
  location                 = azurerm_resource_group.rg02.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
}
```

## What This Project Does

This configuration performs the following steps:

1. Creates a resource group named `rg02` in `eastus`
2. Creates a storage account named `stg02`
3. Places the storage account in the same resource group and region

Terraform automatically understands that the storage account depends on the resource group because the storage account configuration references `azurerm_resource_group.rg02.name` and `azurerm_resource_group.rg02.location`. 

## Prerequisites

Before running this project, make sure you have:

- Terraform installed
- Azure CLI installed
- An active Azure subscription
- Permission to create resource groups and storage accounts
- Azure CLI authenticated with `az login`

## Recommended Project Structure

Terraform recommends keeping a root module README and clear root files for usage and documentation. 

```text
.
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
└── README.md
```

## Example Provider Configuration

```hcl
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}
```

## How to Run

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Validate the configuration

```bash
terraform validate
```

### 3. Preview the execution plan

```bash
terraform plan
```

### 4. Apply the configuration

```bash
terraform apply
```

### 5. Destroy the resources when finished

```bash
terraform destroy
```

## Dependency Flow

| Step | Resource | Depends On |
|---|---|---|
| 1 | Resource Group | None |
| 2 | Storage Account | Resource Group |

This is a basic example of Terraform resource dependency in Azure.

## Important Notes

### Storage account naming

Azure storage account names must:
- Be globally unique
- Be between 3 and 24 characters
- Use only lowercase letters and numbers 

Because of that, the name `stg02` may fail during deployment if it is already used by another Azure customer. 

A safer example would be:

```hcl
name = "stgnakeshdev002"
```

### Resource block name correction

Make sure your Terraform resource label does not include a leading space. Use this:

```hcl
resource "azurerm_resource_group" "rg02" {
```

instead of:

```hcl
resource "azurerm_resource_group" " rg02" {
```

Terraform resource labels should be written cleanly and consistently for valid configuration style. 

## Example Outputs

You can add this in `outputs.tf`:

```hcl
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.rg02.name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.stg02.name
}

output "storage_account_location" {
  description = "The Azure region of the storage account"
  value       = azurerm_storage_account.stg02.location
}
```

## Learning Objectives

This small Terraform project helps practice:

- Creating Azure resources with Terraform
- Understanding resource dependencies
- Referencing one resource inside another
- Deploying Azure Storage Accounts
- Running Terraform lifecycle commands such as init, plan, apply, and destroy

## Future Improvements

This project can be improved by adding:

- Variables for names and location
- Tags for resource organization
- Random suffix generation for unique storage account names
- Remote backend for Terraform state
- Input validation
- Separate environments such as dev and prod

## Summary

This project is a basic Terraform example that creates an Azure Resource Group and an Azure Storage Account. It is a good starting point for learning Azure infrastructure as code and building more advanced Terraform projects later.