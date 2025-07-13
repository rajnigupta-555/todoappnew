output "resource_gp_output" {
  value=azurerm_resource_group.rg-todo.name
}
output "location" {
  value=azurerm_resource_group.rg-todo.location
}