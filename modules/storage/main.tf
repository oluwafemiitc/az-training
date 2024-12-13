# Resource Group
data "azurerm_resource_group" "rg-aztraining-dev-uksouth-spoke1-vms" {
  name = var.resource_group_name
}


resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.name
  location                = data.azurerm_resource_group.rg-aztraining-dev-uksouth-spoke1-vms.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  lifecycle {
    prevent_destroy = true
  }
}