

$remoteComputer = $args[0]  # Remote machine name or IP
$username = $args[1]
$password = $args[2]

$credential = New-Object System.Management.Automation.PSCredential ($username, (ConvertTo-SecureString $password -AsPlainText -Force))

$folderPath = "C:\app"

Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock {
    param($folderPath)
    New-Item -Path $folderPath -ItemType Directory -Force
} -ArgumentList $folderPath


$Session = New-PSSession -ComputerName $remoteComputer -Credential $credential

Copy-Item ".\TestApp.zip" -Destination "C:\app\TestApp.zip" -ToSession $Session

Remove-PSSession -Session $Session

Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock {

            param (
                [string]$siteName = "MyLocalSite",
                [string]$sitePath = "C:\app\TestApp\wwwroot",
                [string]$port = "80",
                [string]$appPoolName = "app",
                [string]$serviceAccount = "DOMAIN\ServiceAccount",
                [string]$servicePassword = "P@ssw0rd"
            )
            Expand-Archive -Path "C:\app\TestApp.zip" -DestinationPath "C:\app\" -Force



            # Enable IIS Feature
            Write-Host "Installing IIS..."
            Install-WindowsFeature -name Web-Server -IncludeManagementTools

            # Install .NET 6.0 Runtime
            Write-Host "Installing .NET 6.0..."
            $dotnetInstallerUrl = "https://builds.dotnet.microsoft.com/dotnet/Sdk/6.0.428/dotnet-sdk-6.0.428-win-x64.exe"
            $installerPath = "$env:TEMP\dotnet6-installer.exe"

            Invoke-WebRequest -Uri $dotnetInstallerUrl -OutFile $installerPath
            Start-Process -FilePath $installerPath -ArgumentList "/quiet /norestart" -Wait
            Remove-Item $installerPath

            # Restart IIS
            Write-Host "Restarting IIS..."
            Restart-Service W3SVC

            Write-Host "IIS and .NET 6.0 installation completed."


            # Create Application Pool
            if (-not (Get-WebAppPool -Name $appPoolName -ErrorAction SilentlyContinue)) {
                New-WebAppPool -Name $appPoolName
            }

            # Set application pool identity to service account
            $pool = Get-Item "IIS:\AppPools\$appPoolName"
            $pool.processModel.identityType = 3  # Set to Specific User
            $pool.processModel.userName = $serviceAccount
            $pool.processModel.password = $servicePassword
            $pool | Set-Item

            # Create website
            if (-not (Get-Website -Name $siteName -ErrorAction SilentlyContinue)) {
                New-Website -Name $siteName -Port $port -PhysicalPath $sitePath -ApplicationPool $appPoolName -Force
            }

            # Grant service account permissions to the folder
            $acl = Get-Acl $sitePath
            $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($serviceAccount, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
            $acl.SetAccessRule($accessRule)
            Set-Acl $sitePath $acl

            Write-Output "IIS site '$siteName' created successfully at http://localhost:$port"


            } 