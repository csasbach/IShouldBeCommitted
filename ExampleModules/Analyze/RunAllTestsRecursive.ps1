$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
Set-Location ..
Get-ChildItem -Directory -Recurse | 
Where-Object { (Get-ChildItem -Path $_.FullName -File).Name -contains 'RunLocalTests.ps1' } |
ForEach-Object {
    Set-Location $_.FullName
    .\RunLocalTests.ps1
    Set-Location ..
}
Set-Location $ScriptDir