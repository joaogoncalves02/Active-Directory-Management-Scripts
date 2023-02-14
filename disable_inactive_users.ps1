# Import the Active Directory module
Import-Module ActiveDirectory

# Get the number of days of inactivity
$daysInactive = Read-Host "Enter the number of days of inactivity"

# Get all user accounts that have been inactive for the specified number of days
$inactiveUsers = Get-ADUser -Filter {Enabled -eq $true -and LastLogonTimeStamp -lt (Get-Date).AddDays(-$daysInactive)} `
                           -Properties Name, LastLogonTimeStamp `
                           -ErrorAction SilentlyContinue

if ($inactiveUsers) {
    # Disable each inactive user account
    foreach ($user in $inactiveUsers) {
        $user | Disable-ADAccount
        Write-Host "User $($user.Name) has been disabled due to inactivity."
    }
}
else {
    Write-Host "No inactive user accounts found."
}
