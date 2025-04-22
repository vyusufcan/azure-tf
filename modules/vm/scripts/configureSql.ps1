$scriptPath = ".\scripts\sql.ps1"  # Local script path
$remoteComputer = $args[0]  # Remote machine name or IP
$username = $args[1]
$password = $args[2]

$credential = New-Object System.Management.Automation.PSCredential ($username, (ConvertTo-SecureString $password -AsPlainText -Force))

Invoke-Command -ComputerName $remoteComputer -Credential $credential -FilePath $scriptPath

