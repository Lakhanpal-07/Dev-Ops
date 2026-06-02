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
 data "terraform_remote_state" "rg" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "mystorageacct"
    container_name       = "tfstate"
    key                  = "resource-group.tfstate"
  }
 }
 