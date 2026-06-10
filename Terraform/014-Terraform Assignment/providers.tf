
# provider block is used to specify the provider and its configuration. In this case, we are using the Azure Resource Manager (azurerm) provider to manage resources in Microsoft Azure.
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
