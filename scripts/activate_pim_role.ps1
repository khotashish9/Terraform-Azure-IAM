# scripts/activate_pim_role.ps1

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory"

# Define parameters
$roleName = "Global Administrator"
$justification = "Automated activation via GitHub Actions"
$durationInHours = 1

# Retrieve the role definition
$roleDefinition = Get-MgRoleManagementDirectoryRoleDefinition | Where-Object { $_.DisplayName -eq $roleName }

if (-not $roleDefinition) {
    Write-Error "Role '$roleName' not found."
    exit 1
}

# Retrieve the current user's ID
$currentUser = Get-MgUser -UserId (Get-MgContext).Account

# Create the role assignment schedule request
New-MgRoleManagementDirectoryRoleAssignmentScheduleRequest `
    -Action "selfActivate" `
    -Justification $justification `
    -PrincipalId $currentUser.Id `
    -RoleDefinitionId $roleDefinition.Id `
    -DirectoryScopeId "/" `
    -ScheduleInfo @{StartDateTime = (Get-Date).ToString("o"); Expiration = @{Type = "AfterDuration"; Duration = "PT${durationInHours}H"}}
