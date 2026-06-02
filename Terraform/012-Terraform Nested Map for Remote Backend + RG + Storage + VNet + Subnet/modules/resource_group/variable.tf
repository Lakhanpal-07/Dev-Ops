variable "rg01" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  default = {
    rg01 = {
      name     = "rg01"
      location = "East US"
      tags = {
        environment = "dev"
        project     = "terraform"
      }
    }
  }
}
