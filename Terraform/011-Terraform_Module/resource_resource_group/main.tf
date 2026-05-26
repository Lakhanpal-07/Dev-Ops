# only string 

variable "test" {
  type    = string
  default = "rg001"
}

# map(list)

variable "test2" {
  type    = list(string)
  default = ["rg01", "rg02"]
}

# map(string)

variable "test1" {
  type = map(string)
  default = {
    name  = "eastus"
    name2 = "westus"
  }
}

#  createing a modular resource group using for each and map(object)

variable "rg_names" {

  type = map(object({
    name     = string
    location = string
    tags     = map(string)

  }))

  default = {
    rg_01 = {
      name     = "rg01_1"
      location = "westus"
      tags = {
        env = "dev"
        app = "prod"
      }
    }
    rg_02 = {
      name     = "rg01_1"
      location = "westus"
      tags = {
        env = "dev"
        app = "prod"
      }
    }
  }
}


resource "azurerm_resource_group" "rg_tf" {

  for_each = var.rg_names

  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}
