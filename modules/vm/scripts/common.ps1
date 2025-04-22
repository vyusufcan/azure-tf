


# Enable WinRM
Enable-PSRemoting -Force

# Set WinRM service to start automatically
Set-Service -Name WinRM -StartupType Automatic
Start-Service -Name WinRM

# Allow your specific IP address through the Windows Firewall for WinRM
$ipAddress = $args[0]  # Replace with your actual IP address
$ruleName = "Allow WinRM from $ipAddress"

# Create a firewall rule to allow the IP address for WinRM
New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -Protocol TCP -Action Allow -LocalPort 5985 -RemoteAddress $ipAddress

# Allow HTTP traffic on port 5985 for WinRM
Enable-NetFirewallRule -Name WINRM-HTTP-In-TCP

Write-Host "WinRM has been enabled and firewall rule has been added for IP: $ipAddress"

winrm set winrm/config/service '@{AllowUnencrypted = "true"}'

New-Item -Path "C:\app", -ItemType Directory -Force


