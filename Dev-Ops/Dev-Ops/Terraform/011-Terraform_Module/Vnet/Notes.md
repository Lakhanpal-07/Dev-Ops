# Azure Resource Group, NSG, VNet, and Subnets with Terraform

This Terraform configuration creates:

- One Azure Resource Group
- One Network Security Group (NSG)
- One Virtual Network (VNet)
- Two Subnets
- NSG associations for both subnets

## Architecture

For each key in `var.rg_nsg_vnet`, Terraform will create:

- A resource group
- An NSG
- A virtual network
- Two subnets
- NSG associations to both subnets

## Prerequisites

Before running this code, make sure you have:

- Terraform installed
- Azure CLI installed and authenticated
- An active Azure subscription
- Permission to create resource groups, VNets, subnets, and NSGs

## Provider Version

This configuration uses:

- Terraform `>= 1.6.0`
- AzureRM provider `~> 4.0`

## Files

- `main.tf` - Main Terraform resources
- `variables.tf` - Input variable definitions
- `terraform.tfvars` - Variable values
- `outputs.tf` - Output values

## Variable Structure

The main input variable is:

- `rg_nsg_vnet` - A map of objects containing:
  - `name`
  - `location`
  - `network_security_group.name`
  - `virtual_network.name`
  - `virtual_network.address_space`
  - `subnet1.name`
  - `subnet1.address_prefix`
  - `subnet2.name`
  - `subnet2.address_prefix`

## Example tfvars

```hcl
rg_nsg_vnet = {
  app1 = {
    name     = "app1"
    location = "westus"

    network_security_group = {
      name = "nsg_demo"
    }

    virtual_network = {
      name          = "vnet_demo"
      address_space  = ["10.0.0.0/16"]
    }

    subnet1 = {
      name           = "subnet1_demo"
      address_prefix  = ["10.0.1.0/24"]
    }

    subnet2 = {
      name           = "subnet2_demo"
      address_prefix  = ["10.0.2.0/24"]
    }
  }
}
```

## Usage

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Validate the configuration
```bash
terraform validate
```

### 3. Review the execution plan
```bash
terraform plan
```

### 4. Apply the configuration
```bash
terraform apply
```

## What Gets Created

For the `app1` entry, Terraform creates:

- Resource Group: `app1`
- NSG: `nsg_demo`
- VNet: `vnet_demo`
- Subnet 1: `subnet1_demo`
- Subnet 2: `subnet2_demo`

Both subnets are associated with the same NSG.

## Notes

- `address_space` must be a list of strings.
- `address_prefix` must be a list of strings.
- NSG is associated with the subnet using `azurerm_subnet_network_security_group_association`.
- Resource names must follow Azure naming rules.

## Outputs

If you add outputs in `outputs.tf`, you can expose values such as:

- Resource group names
- VNet names
- Subnet IDs
- NSG IDs

## Cleanup

To destroy all created resources:

```bash
terraform destroy
```