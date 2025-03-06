data "azurerm_storage_account" "sa_core" {
  name                = "sacorewesteurope${var.environment}"
  resource_group_name = "rg_${var.location}_core_${var.environment}"
}



# resource "azurerm_private_endpoint" "sa" {
#   name                          = lower("pe-${module.sa.name}-001")
#   location                      = data.azurerm_resource_group.critical_rg.location
#   resource_group_name           = data.azurerm_resource_group.critical_rg.name
#   subnet_id                     = data.azurerm_subnet.core_subnet.id
#   custom_network_interface_name = lower("nic-${data.azurerm_storage_account.sa_core.name}")

#   private_service_connection {
#     name                           = "blob"
#     private_connection_resource_id = data.azurerm_storage_account.sa_core.id
#     is_manual_connection           = false
#     subresource_names              = ["blob"]
#   }

#   private_dns_zone_group {
#     name                 = "sa-core"
#     private_dns_zone_ids = ""
#   }
# }
