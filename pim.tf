resource "azuread_directory_role" "global_admin" {
  display_name = "Global Administrator"
}

resource "azuread_directory_role_member" "pim_assignment" {
  role_object_id = azuread_directory_role.global_admin.object_id
  member_object_id = azuread_group.cloud_admins.object_id
}
