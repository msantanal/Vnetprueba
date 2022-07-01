data "azurerm_resource_group" "RG" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "Vnet" {
  name                = var.name_vnet
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "Subnet" {
  name                 = var.name_subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.name_vnet
  address_prefixes     = ["10.0.2.0/24"]
}
