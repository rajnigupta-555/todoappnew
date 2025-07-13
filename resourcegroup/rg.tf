resource "azurerm_resource_group" "rg-todo" {
  name     = var.resource_group_name
  location = var.location
}