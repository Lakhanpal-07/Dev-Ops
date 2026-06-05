
# terraform collection type variable

# "string"
variable "rg_string" {
  type    = string
  default = "rg01"
}
variable "location" {
  type    = string
  default = "westus"
}


# Set(string).
variable "rg_set" {
  type    = set(string)
  default = ["rg03", "rg04"]
}


# map(string)
variable "rg_map" {
  type = map(string)
  default = {
    name     = "rg02"
    location = "eastus"
  }
}

# map(object)

variable "rg_name_map" {
  type = map(object({
    name     = string
    location = string
    tag      = map(string)
  }))

  default = {
    rg06 = {
      name     = "rg06"
      location = "eastus"
      tags = {
        environment = "dev"
        owner       = "john"
      }
    }
    rg07 = {
      name     = "rg07"
      location = "westus"
      tags = {
        environment = "prod"
        owner       = "doe"
      }
    }
  }
}


# List(string).
variable "rg_list" {
  type    = list(string)
  default = ["rg03", "rg04" , "rg09" , "rg10"]
}
