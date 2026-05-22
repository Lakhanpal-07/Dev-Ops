# Terraform AzureRM Provider Setup

This repository contains a basic Terraform configuration to initialize the Azure Resource Manager provider.

The purpose of this code is to define the required Azure provider version and configure the provider block so Terraform can interact with Azure resources. Terraform requires providers to be declared in the `required_providers` block, and provider settings are configured separately in the `provider` block. 

## Code

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }
  }
}

provider "azurerm" {
  features {}
}
```

## What this does

- Declares the `azurerm` provider as a required provider. 
- Pins the AzureRM provider version to `4.73.0` so the same provider version is used consistently. 
- Configures the AzureRM provider using the `features {}` block, which is part of the standard AzureRM provider setup. 

## File structure

```text
.
├── main.tf
└── README.md
```

## Requirements

Before using this configuration, make sure the following are installed:

- Terraform
- Azure CLI
- An active Azure subscription

The AzureRM provider supports authentication methods such as Azure CLI, Managed Identity, and Service Principal. 

## How to use

### 1. Initialize Terraform

```bash
terraform init
```

This command downloads the required provider based on the `required_providers` block. 

### 2. Validate the configuration

```bash
terraform validate
```

This checks whether the Terraform syntax and configuration are valid.

### 3. Authenticate to Azure

If using Azure CLI authentication:

```bash
az login
```

Then confirm the correct subscription is selected:

```bash
az account show
```

### 4. Plan future resources

Once resources are added to this file, run:

```bash
terraform plan
```

### 5. Apply the configuration

After reviewing the plan:

```bash
terraform apply
```

## Explanation

| Block | Purpose |
|-------|---------|
| `terraform` | Defines Terraform settings and required providers.  |
| `required_providers` | Tells Terraform which provider to download and which version to use.  |
| `source = "hashicorp/azurerm"` | Identifies the AzureRM provider source address.  |
| `version = "4.73.0"` | Locks the provider to a specific version for consistency.  |
| `provider "azurerm"` | Configures the AzureRM provider for use in the configuration.  |
| `features {}` | Required block used by the AzureRM provider configuration.  |

## Example next step

After this provider setup, Azure resources can be added, such as a resource group:

```hcl
resource "azurerm_resource_group" "example" {
  name     = "example-rg"
  location = "Central India"
}
```

This follows the same AzureRM provider usage pattern shown in the provider documentation. 

## Best practice notes

- Keep provider versions explicit to avoid unexpected changes during future runs. 
- Run `terraform init` again if the provider version is changed. 
- Commit the Terraform lock file to version control so provider versions stay consistent across environments.

