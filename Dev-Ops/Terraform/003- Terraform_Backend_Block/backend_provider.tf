
# Terraform Backend Block and Provider Configuration...
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
