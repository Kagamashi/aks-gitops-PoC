module "sa" {
  source = "git::https://github.com/Kagamashi/terraform-modules.git/storage_account?ref=v1.0.0"

  name                = "sawesteuropegitops${var.environment}"
  resource_group_name = azurerm_resource_group.core.name
  location            = azurerm_resource_group.core.location

  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  cross_tenant_replication_enabled = false
  access_tier                      = "Hot"
  https_traffic_only_enabled       = true
  min_tls_version                  = "TLS1_2"
  allow_nested_items_to_be_public  = true
  shared_access_key_enabled        = true
  public_network_access_enabled    = true

  network_rules = {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = [""]
    virtual_network_subnet_ids = []
  }

  tags = var.tags
}

resource "azurerm_private_endpoint" "sa" {
  name                          = lower("pe-${module.sa.name}-001")
  location                      = data.azurerm_resource_group.critical_rg.location
  resource_group_name           = data.azurerm_resource_group.critical_rg.name
  subnet_id                     = data.azurerm_subnet.core_subnet.id
  custom_network_interface_name = lower("nic-${data.azurerm_storage_account.sa_core.name}")

  private_service_connection {
    name                           = "blob"
    private_connection_resource_id = data.azurerm_storage_account.sa_core.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "sa-core"
    private_dns_zone_ids = ""
  }
}