data "azurerm_resource_group" "RG" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "Vnet" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "Subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.2.0/24"]
  
  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/26"
  }
}
