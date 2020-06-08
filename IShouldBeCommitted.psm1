param(
    [parameter(Position=0,Mandatory=$false)][string]$configPath
)

$defaultConfigPath = "$($MyInvocation.MyCommand.Path).config.json"
$configPath = if([string]::IsNullOrWhiteSpace($configPath) -eq $True) { $defaultConfigPath } else { $configPath }
$config = $(if([string]::IsNullOrWhiteSpace($configPath) -eq $False) { try{ Get-Content -Path $configPath -ErrorAction Stop }catch{ '{}' } } else { '{}' }) | ConvertFrom-Json

function Run(){
    param(
        [parameter(Position=0,Mandatory=$false)][string]$configPath,
        [parameter(Position=1,Mandatory=$false)][switch]$dontUpdate,
        [parameter(Position=2,Mandatory=$false)][switch]$dontBuild,
        [parameter(Position=3,Mandatory=$false)][switch]$dontAnalyze,
        [parameter(Position=4,Mandatory=$false)][switch]$dontTest,
        [parameter(Position=5,Mandatory=$false)][switch]$dontCommit,
        [parameter(Position=6,Mandatory=$false)][switch]$dontPush
    )

    $dontUpdate = if ($dontUpdate) { $True } elseif ($script:config.dontUpdate -eq 'true') { $True } else { $False }
    $dontBuild = if ($dontBuild) { $True } elseif ($script:config.dontBuild -eq 'true') { $True } else { $False }
    $dontAnalyze = if ($dontAnalyze) { $True } elseif ($config.dontAnalyze -eq 'true') { $True } else { $False }
    $dontTest = if ($dontTest) { $True } elseif ($script:config.dontTest -eq 'true') { $True } else { $False }
    $dontCommit = if ($dontCommit) { $True } elseif ($script:config.dontCommit -eq 'true') { $True } else { $False }
    $dontPush = if ($dontPush) { $True } elseif ($script:config.dontPush -eq 'true') { $True } else { $False }

    if(-not $dontUpdate) { Write-Output "Attempting to Update..."; TryUpdate } else { Write-Output "Skipping Update step..."}
    if(-not $dontBuild) { Write-Output "Attempting to Build..."; TryBuild } else { Write-Output "Skipping Build step..."}
    if(-not $dontAnalyze) { Write-Output "Attempting to Analyze..."; TryAnalyze } else { Write-Output "Skipping Analyze step..."}
    if(-not $dontTest) { Write-Output "Attempting to Test..."; TryTest } else { Write-Output "Skipping Test step..."}
    if(-not $dontCommit) { Write-Output "Attempting to Commit..."; TryCommit } else { Write-Output "Skipping Commit step..."}
    if(-not $dontPush) { Write-Output "Attempting to Push..."; TryPush } else { Write-Output "Skipping Push step..."}
} 
Export-ModuleMember -Function Run

$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
$ImplModulesDir = "$ScriptDir\ExampleModules"

Import-Module -Name $ImplModulesDir\Update\Update.psm1
function TryUpdate {
    $result = Update
    if($result -eq 0) {
        return "Successfully Updated..."
    }
    else {
        return "Failed to Update!"
    }
} 
Export-ModuleMember -Function TryUpdate

Import-Module -Name $ImplModulesDir\Build\Build.psm1
function TryBuild {
    $result = Build
    if($result -eq 0) {
        return "Successfully Built..."
    }
    else {
        return "Failed to Build!"
    }
} 
Export-ModuleMember -Function TryBuild

Import-Module -Name $ImplModulesDir\Analyze\Analyze.psm1
function TryAnalyze {
    $result = Analyze
    if($result -eq 0) {
        return "Successfully Analyzed..."
    }
    else {
        return "Failed to Analyze!"
    }
} 
Export-ModuleMember -Function TryAnalyze

Import-Module -Name $ImplModulesDir\Test\Test.psm1
function TryTest {
    $result = Test
    if($result -eq 0) {
        return "Successfully Tested..."
    }
    else {
        return "Failed to Test!"
    }
} 
Export-ModuleMember -Function TryTest

Import-Module -Name $ImplModulesDir\Commit\Commit.psm1
function TryCommit {
    $result = Commit
    if($result -eq 0) {
        return "Successfully Committed..."
    }
    else {
        return "Failed to Commit!"
    }
} 
Export-ModuleMember -Function TryCommit

Import-Module -Name $ImplModulesDir\Push\Push.psm1
function TryPush {
    $result = Push
    if($result -eq 0) {
        return "Successfully Pushed..."
    }
    else {
        return "Failed to Push!"
    }
} 
Export-ModuleMember -Function TryPush