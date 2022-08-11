variable "resource_group_name" {
  type = string
  default = "rg-demo"
  description = "resource group name"
}
variable "location" {
    type = string
}
variable "vnet_name" {
    type = string
}
variable "vnet_address_space" {
    type = string
}
variable "docker_bridge_cidr" {
    type = string
}
variable subnet_name {
    type = string
}
variable "aks-demo-subnet_prefix" {
    type = string
}
variable "acr_name" {
    type = string
}
variable "acr_sku" {
  default = ""
}
===================================
variable "agentnode" {
  default = "1"
}
variable "subscription_id" {
  default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
variable "client_id" {
  default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
variable "client_secret" {
  default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
variable "tenant_id" {
  default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}