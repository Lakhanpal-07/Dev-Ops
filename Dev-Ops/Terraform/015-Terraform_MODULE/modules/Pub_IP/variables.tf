variable "public_ip_names" {
  type = set(string)
}
variable "rgs" {
  type = map(object({
    name     = string
    location = string
  }))
}
