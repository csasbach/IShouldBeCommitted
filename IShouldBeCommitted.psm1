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