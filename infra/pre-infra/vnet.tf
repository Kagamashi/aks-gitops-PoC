resource "azurerm_virtual_network" "core" {
  name                = "vnet_core_01_${var.environment}"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "aks_usernode" {
  name                 = "snet_aks_vnet_core_01_${var.environment}"
  resource_group_name  = azurerm_resource_group.core.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "aks_systemnode" {
  name                 = "snet_aks_system_core_01_${var.environment}"
  resource_group_name  = azurerm_resource_group.core.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "services" {
  name                 = "snet_services_vnet_core_01_${var.environment}"
  resource_group_name  = azurerm_resource_group.core.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.0.3.0/24"]
}

# 10.0.4-10.0/24
# ...
