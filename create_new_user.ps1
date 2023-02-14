# Import the Active Directory module
Import-Module ActiveDirectory

# Get user input for new user account
$firstName = Read-Host "Enter the user's first name"
$lastName = Read-Host "Enter the user's last name"
$username = Read-Host "Enter the user's username"
$password = Read-Host "Enter the user's password" -AsSecureString
$email = Read-Host "Enter the user's email address"
$groupMembership = Read-Host "Enter the groups to add the user to (separate by comma)"

# Create the new user account
New-ADUser -Name "$firstName $lastName" `
           -SamAccountName $username `
           -AccountPassword $password `
           -EmailAddress $email `
           -Enabled $true `
           -ChangePasswordAtLogon $true `
           -Path "OU=Users,DC=example,DC=com" `
           -OtherAttributes @{'mailNickname'=$username} `
           -ErrorAction Stop

# Add user to specified groups
$groups = $groupMembership -split ","
foreach ($group in $groups) {
    Add-ADGroupMember -Identity $group -Members $username
}

# Confirm account creation
Write-Host "User $username has been created successfully."
