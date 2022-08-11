variable "location" {
  type = string
  default = "Central India"
}

variable "resource_group_name" {
  type = string
  default = "aks-rg"
}

# Azure AKS Environment Name
variable "environment" {
  type = string  
  default = "dev"
}


