
data "azurerm_resource_group" "RG" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.name_vnet
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.name_subnet
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.vnet.name_vnet
  address_prefixes     = ["10.0.2.0/24"]
}
