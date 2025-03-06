resource "azurerm_resource_group" "gitops" {
  name     = "rg_${var.location}_gitops_${var.environment}"
  location = var.location
}
