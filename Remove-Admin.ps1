#Requires -RunAsAdministrator

<#
.SYNOPSIS
    Removes a local user from the Administrators group, changing them to a Standard User.
.DESCRIPTION
    This script prompts for a username and removes that user from the local Administrators
    group. It's a safe way to demote an account from admin to standard user privileges.
    The script MUST be run with administrator rights.
.NOTES
    Author: Gemini
    Version: 1.0
    WARNING: Before running this script, ensure you have another account on the
             PC with administrator privileges. If you remove the only admin account,
             you will lock yourself out of administrative tasks.
#>

function Remove-AdminPrivileges {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true, HelpMessage = "Enter the username of the account to modify.")]
        [string]$Username
    )

    # --- Check if the user exists before proceeding ---
    try {
        $user = Get-LocalUser -Name $Username -ErrorAction Stop
    }
    catch {
        Write-Host "Error: The user '$Username' was not found on this computer." -ForegroundColor Red
        return
    }

    # --- Confirm the action with the user ---
    $confirmation = Read-Host "Are you sure you want to remove admin privileges from '$Username'? (Y/N)"
    if ($confirmation -ne 'Y') {
        Write-Host "Operation cancelled by user." -ForegroundColor Yellow
        return
    }

    # --- Perform the removal from the Administrators group ---
    try {
        if ($PSCmdlet.ShouldProcess("user '$Username'", "Removing from Administrators group")) {
            Remove-LocalGroupMember -Group "Administrators" -Member $Username -ErrorAction Stop
            Write-Host "Successfully removed '$Username' from the Administrators group." -ForegroundColor Green

            # --- Add the user to the 'Users' group to ensure it's a standard account ---
            Add-LocalGroupMember -Group "Users" -Member $Username -ErrorAction SilentlyContinue
            Write-Host "'$Username' is now a Standard User." -ForegroundColor Green
        }
    }
    catch {
        # This block will catch errors, e.g., if the user was not in the group
        Write-Host "An error occurred." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
}

# --- Main script execution ---
Write-Host "--- Remove Administrator Privileges Tool ---" -ForegroundColor Cyan
$targetUser = Read-Host "Please enter the username you want to change to a Standard User"

if (-not [string]::IsNullOrWhiteSpace($targetUser)) {
    Remove-AdminPrivileges -Username $targetUser
}
else {
    Write-Host "No username entered. Exiting script." -ForegroundColor Yellow
}

Write-Host "Script finished. Press Enter to exit."
Read-Host
#Requires -RunAsAdministrator

<#
.SYNOPSIS
    Removes a local user from the Administrators group, changing them to a Standard User.
.DESCRIPTION
    This script prompts for a username and removes that user from the local Administrators
    group. It's a safe way to demote an account from admin to standard user privileges.
    The script MUST be run with administrator rights.
.NOTES
    Author: Gemini
    Version: 1.0
    WARNING: Before running this script, ensure you have another account on the
             PC with administrator privileges. If you remove the only admin account,
             you will lock yourself out of administrative tasks.
#>

function Remove-AdminPrivileges {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true, HelpMessage = "Enter the username of the account to modify.")]
        [string]$Username
    )

    # --- Check if the user exists before proceeding ---
    try {
        $user = Get-LocalUser -Name $Username -ErrorAction Stop
    }
    catch {
        Write-Host "Error: The user '$Username' was not found on this computer." -ForegroundColor Red
        return
    }

    # --- Confirm the action with the user ---
    $confirmation = Read-Host "Are you sure you want to remove admin privileges from '$Username'? (Y/N)"
    if ($confirmation -ne 'Y') {
        Write-Host "Operation cancelled by user." -ForegroundColor Yellow
        return
    }

    # --- Perform the removal from the Administrators group ---
    try {
        if ($PSCmdlet.ShouldProcess("user '$Username'", "Removing from Administrators group")) {
            Remove-LocalGroupMember -Group "Administrators" -Member $Username -ErrorAction Stop
            Write-Host "Successfully removed '$Username' from the Administrators group." -ForegroundColor Green

            # --- Add the user to the 'Users' group to ensure it's a standard account ---
            Add-LocalGroupMember -Group "Users" -Member $Username -ErrorAction SilentlyContinue
            Write-Host "'$Username' is now a Standard User." -ForegroundColor Green
        }
    }
    catch {
        # This block will catch errors, e.g., if the user was not in the group
        Write-Host "An error occurred." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
}

# --- Main script execution ---
Write-Host "--- Remove Administrator Privileges Tool ---" -ForegroundColor Cyan
$targetUser = Read-Host "Please enter the username you want to change to a Standard User"

if (-not [string]::IsNullOrWhiteSpace($targetUser)) {
    Remove-AdminPrivileges -Username $targetUser
}
else {
    Write-Host "No username entered. Exiting script." -ForegroundColor Yellow
}

Write-Host "Script finished. Press Enter to exit."
Read-Host
