resource "azuread_conditional_access_policy" "require_mfa" {
  display_name = "Require MFA for all users"
  state        = "enabled"

  conditions {
    users {
      include_users = ["All"]
    }
  }

  grant_controls {
    operator = "AND"
    built_in_controls = ["mfa"]
  }
}
