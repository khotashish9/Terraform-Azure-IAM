terraform {
  backend "azurerm" {
    resource_group_name  = "csi-rg-test"
    storage_account_name = "tfstatestraccount"
    container_name       = "tfstateiamfile"
    key                  = "landingzone.terraform.tfstate"
  }
}