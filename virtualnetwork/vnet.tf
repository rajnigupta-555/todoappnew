resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.vnet_location
  resource_group_name = var.vnet_resource_group

}

