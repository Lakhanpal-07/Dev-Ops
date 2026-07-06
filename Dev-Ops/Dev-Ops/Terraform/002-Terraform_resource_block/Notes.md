# Terraform Azure Resource Group

This repository contains a simple Terraform configuration that creates an Azure Resource Group in the `eastus` region using the AzureRM provider. AzureRM is the Terraform provider for managing infrastructure in Microsoft Azure. 

## Overview

The configuration provisions one Azure Resource Group:

- Resource group name: `rg01`
- Azure region: `eastus` 

This is a basic starter example for learning Terraform on Azure and can be extended later with additional resources such as storage accounts, virtual networks, or virtual machines. 

## Terraform Configuration

```hcl
# resource group for the project
resource "azurerm_resource_group" "rg01" {
  name     = "rg01"
  location = "eastus"
}
```

## Project Structure

```text
.
├── main.tf
└── README.md
```

HashiCorp’s standard Terraform structure recommends keeping a `README.md` in the root module to describe the purpose and usage of the configuration. 

## Requirements

| Name | Version |
|------|---------|
| Terraform | Compatible with your installed version |
| AzureRM Provider | Must be initialized before apply  |
| Azure CLI | Required for CLI-based authentication |

## Resources

| Name | Type |
|------|------|
| `azurerm_resource_group.rg01` | Azure Resource Group  |

## Prerequisites

Before running this project, make sure the following are ready:

- Terraform is installed
- Azure CLI is installed
- You have access to an Azure subscription
- You are authenticated to Azure

The Azure tutorials from HashiCorp and Microsoft both use initialization, authentication, planning, and apply steps for Azure Terraform workflows. 

## Usage

### 1. Clone or create the project

Save the Terraform code in a file such as `main.tf`.

### 2. Initialize Terraform

```bash
terraform init
```

This downloads the required provider plugins and prepares the working directory. 

### 3. Authenticate to Azure

```bash
az login
```

If you have multiple subscriptions, confirm the active one:

```bash
az account show
```

### 4. Validate the configuration

```bash
terraform validate
```

This checks whether the syntax and structure are valid before execution.

### 5. Review the execution plan

```bash
terraform plan
```

This shows the proposed infrastructure changes before deployment. 

### 6. Apply the configuration

```bash
terraform apply
```

Type `yes` when prompted to create the resource group.

## Expected Result

After a successful apply, Terraform creates a Resource Group named `rg01` in the `eastus` Azure region. 
## Resource Explanation

| Argument | Description |
|----------|-------------|
| `resource "azurerm_resource_group" "rg01"` | Declares an Azure Resource Group resource in Terraform.  |
| `name = "rg01"` | Sets the name of the resource group in Azure.  |
| `location = "eastus"` | Defines the Azure region for the resource group. 

## Verification

You can verify the resource group after deployment with Azure CLI:

```bash
az group show --name rg01
```

Microsoft’s Azure Terraform quickstart also recommends verifying created infrastructure after apply. 

## Cleanup

To remove the resource group managed by this configuration:

```bash
terraform destroy
```

Use this carefully, because destroying a resource group can remove all resources managed inside it. Azure resource groups act as logical containers for related resources.

## Best Practices

- Use meaningful and consistent naming for Azure resources.
- Keep simple resources in `main.tf` when learning, then split into `providers.tf`, `variables.tf`, and `outputs.tf` as the project grows.
- Add variables for resource name and location to make the configuration reusable. 
- Commit your Terraform files and lock file to version control for consistency.

## Next Improvements

This project can be improved by adding:

- Provider configuration
- Variables for `name` and `location`
- Outputs for the resource group name and ID
- Tags for better governance
- Modular structure for reuse

## Example Next Step

A common next step is to combine this resource group with other Azure resources such as:

- Storage account
- Virtual network
- Network security group
- Virtual machine

This turns a basic Terraform example into a practical Azure infrastructure project.