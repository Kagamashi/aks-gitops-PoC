data "azurerm_client_config" "current" {}

data "azurerm_subscription" "subcription" {}

data "azurerm_resource_group" "core" {
  name = "rg_${var.location}_core_${var.environment}"
}
