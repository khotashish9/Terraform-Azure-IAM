provider "azurerm" {
  features {}
}

provider "azuread" {
}

provider "microsoft.authorization" {
  alias = "authz"
}
