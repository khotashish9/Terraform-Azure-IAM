terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.50.0"
    }
    time = {
      source = "hashicorp/time"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}
