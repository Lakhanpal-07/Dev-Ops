terraform {
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.73.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = "test.tfstate"
  }
}
provider "azurerm" {
  features {}
}
