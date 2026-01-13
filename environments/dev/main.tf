terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-demo"
  location = "UK South"
}

module "networking" {
  source              = "../../modules/networking"
  vnet_name           = "vnet-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "security" {
  source              = "../../modules/security"
  nsg_name            = "nsg-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.networking.subnet_id
}

module "storage" {
  source               = "../../modules/storage"
  storage_account_name = "stterraformdemo${random_string.suffix.result}"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}