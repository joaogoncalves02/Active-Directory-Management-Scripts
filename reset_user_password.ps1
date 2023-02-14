# Get username of account to reset password for
$username = Read-Host "Enter username"

# Generate new password
$newPassword = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 10 | % {[char]$_})

# Set new password for account
Set-ADAccountPassword -Identity $username -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $newPassword -Force)

# Output new password
Write-Host "New password for $username: $newPassword"
