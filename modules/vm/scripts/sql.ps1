


Install-PackageProvider NuGet -Force;
Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module -Name SqlServer


Enable-WSManCredSSP -Role "Server" -Force


Enable-WSManCredSSP -Role Server -Force
Enable-WSManCredSSP -Role client -DelegateComputer * -Force
Set-Item -Path "wsman:\localhost\service\auth\credSSP" -Value $True -Force


New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation -Name AllowFreshCredentialsWhenNTLMOnly -Force
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation\AllowFreshCredentialsWhenNTLMOnly -Name 1 -Value * -PropertyType String



Write-Host "Downloading SQL Server Express 2019..."
$Path = $env:TEMP
$Installer = "SQL2019-SSEI-Expr.exe"
$URL = "https://go.microsoft.com/fwlink/?linkid=866658"
Invoke-WebRequest $URL -OutFile $Path\$Installer

Write-Host "Installing SQL Server Express..."
Start-Process -FilePath $Path\$Installer -Args "/ACTION=INSTALL /IACCEPTSQLSERVERLICENSETERMS /QUIET" -Verb RunAs -Wait


$SSMSInstallerUrl = "https://aka.ms/ssmsfullsetup"  # Latest SQL Server Management Studio


$SSMSInstallerPath = "C:\SSMSInstaller.exe"


# Download SSMS
Write-Host "Downloading SQL Server Management Studio..."
Invoke-WebRequest -Uri $SSMSInstallerUrl -OutFile $SSMSInstallerPath

# Install SSMS
Write-Host "Installing SQL Server Management Studio..."
Start-Process -FilePath $SSMSInstallerPath -ArgumentList "/install /quiet /norestart" -Verb RunAs -Wait


Write-Host "SQL Server and SSMS installation completed successfully!"


# Define the file path for the SQL script
$sqlFilePath = "C:\RTXSQLSAMPLE.sql"

# The SQL script content
$sqlScript = @"
USE [master]
GO
/****** Object:  Database [RTXSQLSAMPLE]    Script Date: 3/25/2022 12:42:50 PM ******/
CREATE DATABASE [RTXSQLSAMPLE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RTXSQLSAMPLE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\RTXSQLSAMPLE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RTXSQLSAMPLE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\RTXSQLSAMPLE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RTXSQLSAMPLE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RTXSQLSAMPLE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RTXSQLSAMPLE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET ARITHABORT OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET RECOVERY FULL 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET  MULTI_USER 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RTXSQLSAMPLE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RTXSQLSAMPLE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RTXSQLSAMPLE', N'ON'
GO
ALTER DATABASE [RTXSQLSAMPLE] SET QUERY_STORE = OFF
GO
USE [RTXSQLSAMPLE]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/25/2022 12:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToDo]    Script Date: 3/25/2022 12:42:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToDo](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[Task] [nvarchar](max) NULL,
 CONSTRAINT [PK_ToDo] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [RTXSQLSAMPLE] SET  READ_WRITE 
GO
"@

# Write the script to the SQL file
Set-Content -Path $sqlFilePath -Value $sqlScript
Write-Host "SQL script has been written to $sqlFilePath"

Install-Module sqlserver

# Define the path to the SQL file
$sqlFilePath = "C:\RTXSQLSAMPLE.sql"

# SQL Server instance details
$serverName = "x12d1clddemdb01\SQLEXPRESS"  # SQL Server instance name (use the correct instance name)
$databaseName = "master"   # Database where the script will run

# Run the SQL script using sqlcmd
$sqlcmdArgs = "-S $serverName -d $databaseName -i $sqlFilePath"
Invoke-Sqlcmd -ServerInstance $serverName -Database $databaseName -InputFile $sqlFilePath  -TrustServerCertificate

Write-Host "SQL script has been executed."