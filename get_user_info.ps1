# Get username of account to retrieve information for
$username = Read-Host "Enter username"

# Get user information
$user = Get-ADUser -Identity $username -Properties *

# Output user information
$user | Format-List Name, DisplayName, Description,
