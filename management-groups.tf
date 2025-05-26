resource "azurerm_management_group" "platform" {
  display_name = "Platform"
  name         = "mg-platform"
}

resource "azurerm_management_group" "dev" {
  display_name = "Development"
  name         = "mg-dev"
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "prod" {
  display_name = "Production"
  name         = "mg-prod"
  parent_management_group_id = azurerm_management_group.platform.id
}