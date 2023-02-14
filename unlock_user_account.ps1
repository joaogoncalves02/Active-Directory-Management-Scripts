# Get username of account to unlock
$username = Read-Host "Enter username"

# Unlock account
Unlock-ADAccount -Identity $username

# Output confirmation message
Write-Host "$username has been unlocked"
