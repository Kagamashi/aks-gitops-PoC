terraform {
  backend "azurerm" {
    resource_group_name  = "rg_${var.location}_core_${var.environment}"
    storage_account_name = "sacorewesteurope${var.environment}"
    container_name       = "terraform"
    key                  = "infra.terraform.tfstate"
    subscription_id      = data.azurerm_subscription.subscription.id
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.1, <5.0.0"
    }
  }

  required_version = ">=1.10.0"
}
