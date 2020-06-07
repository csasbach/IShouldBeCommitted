.\UninstallPester3.ps1
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 
Install-Module PowerShellGet -RequiredVersion 2.2.4 -SkipPublisherCheck -Force
Install-module -name Pester -RequiredVersion 4.10.1 -Force