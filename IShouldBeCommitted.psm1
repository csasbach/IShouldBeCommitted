$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
Import-Module -Name $ScriptDir\UpdateCode\UpdateCode.psm1

function TryUpdateCode {
    $result = UpdateCode
    if($result -eq 0) {
        return "Successfully updated code..."
    }
    else {
        return "Failed to update code!"
    }
}
 
Export-ModuleMember -Function TryUpdateCode