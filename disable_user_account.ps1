# Get username of account to disable
$username = Read-Host "Enter username"

# Disable account
Disable-ADAccount -Identity $username

# Output confirmation message
Write-Host "$username has been disabled"
