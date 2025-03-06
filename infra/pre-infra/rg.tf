resource "azurerm_resource_group" "core" {
  name     = "rg_${var.location}_core_${var.environment}"
  location = var.location
}
