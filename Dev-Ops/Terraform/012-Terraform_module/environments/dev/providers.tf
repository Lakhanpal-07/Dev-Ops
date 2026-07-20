terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "backend_stg"
    storage_account_name = "backendmystg01"
    container_name       = "backendcont"
    key                  = "dev01.tfstate"
  }
}
provider "azurerm" {
  features {}
}