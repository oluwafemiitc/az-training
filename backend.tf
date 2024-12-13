# backend.tf
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-aztraining-dev-uksouth-hub"
    storage_account_name = "stgaztrainingdevuktf"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

