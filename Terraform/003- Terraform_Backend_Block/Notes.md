# Terraform AzureRM Backend

This project uses Terraform with the AzureRM provider and remote state in Azure Storage.

## Code

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg01"
    storage_account_name = "stterraformstate"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}
```

## Purpose

This configuration does two things:

- Uses the AzureRM provider for Azure resources. 
- Stores the Terraform state file in Azure Blob Storage. 

## Backend Details

| Setting | Value |
|--------|-------|
| Resource Group | `rg01` |
| Storage Account | `stterraformstate` |
| Container | `tfstate` |
| State File | `dev.tfstate` |

The `required_providers` block tells Terraform which provider to download and use. 

The `backend "azurerm"` block tells Terraform to keep the state remotely in Azure Storage instead of a local state file. 

## Prerequisites

- Terraform installed
- Azure CLI installed
- Azure subscription access
- Existing storage account and container for state 

## Usage

```bash
terraform init
terraform plan
terraform apply
```

Run `terraform init` first so Terraform can initialize the AzureRM backend and provider. 

## Note

The backend resources must already exist before Terraform can use them. 

Add this provider block separately in your Terraform code:

```hcl
provider "azurerm" {
  features {}
}
```

The AzureRM provider configuration is separate from the backend block. 