terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend-dev"
    storage_account_name = "stterraformbackenddev"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }

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
