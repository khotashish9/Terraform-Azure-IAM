resource "azuread_group" "cloud_admins" {
  display_name     = "Cloud Admins"
  security_enabled = true
  mail_enabled     = false
}
