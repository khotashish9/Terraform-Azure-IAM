resource "azurerm_role_assignment" "cloud_admin_assignment" {
  scope                = azurerm_management_group.dev.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.cloud_admins.object_id
}
