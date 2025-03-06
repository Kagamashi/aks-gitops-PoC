data "azurerm_virtual_network" "core" {
  name                = "vnet_core_01_${var.environment}"
  resource_group_name = azurerm_resource_group.core.name
}
