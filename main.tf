terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.69.0"
    }
  }
  required_version = ">= 1.5.5"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "core-rg" {
  name     = "rg-max-test"
  location = "uksouth"
}

resource "azurerm_virtual_network" "core-vnet" {
  name = "core-vnet"
  location = azurerm_resource_group.core-rg.location
  resource_group_name = azurerm_resource_group.core-rg.name
  address_space = ["10.0.0.0*/16"]  
}