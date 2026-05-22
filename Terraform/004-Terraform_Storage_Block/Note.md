# Azure Resource Group, Storage Account, Container, and Blob Using Terraform

This project uses Terraform to provision a basic Azure storage setup.

The configuration creates:
- One Azure Resource Group
- One Azure Storage Account
- One Azure Storage Container
- One Azure Storage Blob uploaded from a local file

This project is useful for learning and practicing Terraform with Azure resources, especially storage-related services and resource dependencies.

## Architecture

The Terraform code provisions the following flow:

1. Create a Resource Group
2. Create a Storage Account inside the Resource Group
3. Create a Storage Container inside the Storage Account
4. Upload a Blob into the Storage Container from a local file

## Resources

| Resource Type | Terraform Name | Description |
|---|---|---|
| Resource Group | `azurerm_resource_group.rg01` | Creates the Azure resource group |
| Storage Account | `azurerm_storage_account.stg01` | Creates the storage account |
| Storage Container | `azurerm_storage_container.mypubcon` | Creates the blob container |
| Storage Blob | `azurerm_storage_blob.myblob` | Uploads the local `index.html` file as a blob |

## Terraform Code

```hcl
# resource group required for the storage account

resource "azurerm_resource_group" "rg01" {
  name     = "rg01"
  location = "eastus"
}

# storage account for the project

resource "azurerm_storage_account" "stg01" {
  name                     = "stg01"
  resource_group_name      = azurerm_resource_group.rg01.name
  location                 = azurerm_resource_group.rg01.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"
}

resource "azurerm_storage_container" "mypubcon" {
  name                  = "stgcontainer01"
  storage_account_id    = azurerm_storage_account.stg01.id
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "myblob" {
  name                   = "myblob01"
  storage_account_name   = azurerm_storage_account.stg01.name
  storage_container_name = azurerm_storage_container.mypubcon.name
  type                   = "Block"
  source                 = "index.html"
}
```

## Prerequisites

Before running this project, ensure the following are available:

- Terraform installed
- Azure CLI installed
- An Azure subscription
- Valid Azure login session
- A local file named `index.html` present in the same directory

## Recommended File Structure

A simple Terraform project commonly keeps Terraform files in the repository root and includes a `README.md` that explains usage and purpose. 

```text
.
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── index.html
└── README.md
```

## Provider Configuration Example

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

## How to Use

### 1. Clone the repository

```bash
git clone <your-repo-url>
cd <your-repo-folder>
```

### 2. Login to Azure

```bash
az login
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Validate the configuration

```bash
terraform validate
```

### 5. Preview the execution plan

```bash
terraform plan
```

### 6. Apply the configuration

```bash
terraform apply
```

### 7. Destroy resources when no longer needed

```bash
terraform destroy
```

## How the Dependencies Work

Terraform automatically understands the dependency chain in this project because resources reference one another directly.

- The storage account depends on the resource group.
- The storage container depends on the storage account.
- The storage blob depends on both the storage account and storage container.

This makes Terraform create resources in the correct order.

## Important Notes

### Storage account name

Azure storage account names must be globally unique, between 3 and 24 characters, and use only lowercase letters and numbers. Because of that, `stg01` may fail if the name is already taken. 

A better example would be:

```hcl
name = "stgnakeshdev001"
```

### Blob source file

The blob resource uses:

```hcl
source = "index.html"
```

That means the file `index.html` must exist locally in the project folder before running `terraform apply`.

### Access type

The storage container is created with:

```hcl
container_access_type = "blob"
```

This allows anonymous public read access for blobs in the container. Use this only when public blob access is intended.

## Example Outputs

You can add the following outputs to `outputs.tf`:

```hcl
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.rg01.name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.stg01.name
}

output "storage_container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.mypubcon.name
}

output "blob_name" {
  description = "The name of the uploaded blob"
  value       = azurerm_storage_blob.myblob.name
}
```

## Learning Objectives

This project helps practice the following Terraform and Azure concepts:

- Writing Azure resource blocks in Terraform
- Managing resource dependencies
- Creating storage resources in Azure
- Uploading a local file as a blob
- Understanding infrastructure as code workflow
- Using Terraform plan, apply, and destroy safely

## Future Improvements

This project can be improved by adding:

- Variables for resource names and location
- Tags for resource management
- Random suffix generation for globally unique storage account names
- Remote backend for Terraform state
- Separate files for `main.tf`, `variables.tf`, and `outputs.tf`
- Validation rules for inputs
- Reusable Terraform module structure

## Best Practice Suggestion

For better maintainability, avoid hardcoded values and move names, location, and configuration into variables. Terraform documentation also recommends keeping clear repository structure and README documentation for the root module. 

## Summary

This is a basic Terraform practice project that creates an Azure Resource Group, Storage Account, Storage Container, and uploads a Blob from a local file. It is a good starter example for Azure storage automation using Terraform.