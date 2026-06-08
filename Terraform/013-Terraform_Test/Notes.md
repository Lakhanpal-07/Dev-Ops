# Terraform Project Notes: Modular Azure Infrastructure

## Overview
This project implements a scalable Azure infrastructure using **Terraform Child Modules** and **Nested Maps**. The design follows a configuration-driven approach where the root module orchestrates resource creation based on maps defined in `terraform.tfvars`.

## Architecture
The project is divided into specialized modules for better maintainability:

1.  **Resource Group (`modules/resource_group`)**: The foundation for all Azure resources.
2.  **Virtual Network (`modules/virtual_network`)**: Network backbone for the environment.
3.  **Subnet (`modules/subnet`)**: Logical segments within VNets.
4.  **Network Security Group (`modules/network_security_group`)**: Security rules and subnet associations.
5.  **Virtual Machine (`modules/virtual_machine`)**: Compute resources (Ubuntu Linux) with Public IPs and NICs.
6.  **VNet Peering (`modules/vnet_peering`)**: Enables communication between the Hub and Spoke networks.
7.  **Azure Bastion (`modules/bastion_host`)**: Secure RDP/SSH access without public IP exposure.

## Configuration Strategy: Nested Maps
We use a **Resource-Specific Map** strategy. Each resource type has its own map in `terraform.tfvars`. Dependencies are handled in the root `main.tf` by mapping keys (e.g., `rg_key`, `vnet_key`) to actual resource outputs.

### Example Map (`vnets`)
```hcl
vnets = {
  "vnet1" = { 
    name          = "vnet-hub", 
    address_space = ["10.0.0.0/16"], 
    rg_key        = "rg1" 
  }
}
```

## How to Use

### 1. Initialization
Download the `azurerm` provider and initialize child modules:
```bash
terraform init
```

### 2. Validation
Check the configuration for syntax errors:
```bash
terraform validate
```

### 3. Execution
To see the execution plan (requires Azure credentials):
```bash
terraform plan
```

## Key Benefits
- **Scalability**: Add new RGs, VNets, or VMs simply by adding entries to the maps in `terraform.tfvars`.
- **Dry Principle**: Logic is encapsulated in modules; the root module is purely for orchestration.
- **Flexibility**: Individual resources can be updated or removed without affecting the entire structure.
