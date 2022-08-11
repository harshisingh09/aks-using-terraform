resource "azurerm_virtual_network" "aks" {
  name     = "${var.vnet_name}-${var.environment}"
  location = var.location
  resource_group_name = var.resource_group_name
  address_space = [var.vnet_address_space]
}

resource "azurerm_subnet" "aks-subnet" {
  name                = "${var.subnet_name}-${var.environment}"
  virtual_network_name = azurerm_virtual_network.aks.name
  resource_group_name = var.resource_group_name
  address_prefixes =  [var.aks-demo-subnet_prefix]
}

resource "azurerm_network_security_group" "nsg" {
    name = var.nsg_name
    location = var.location
    resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "nsg_as" {
    subnet_id = azurerm_subnet.aks-subnet.id
    network_security_group_id = azurerm_network_security_group.nsg.id
}