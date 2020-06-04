$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
Import-Module -Name $ScriptDir\Analyze.psm1
 
Describe "Analyze" {
    It "Test if code is analyzed." {
        Analyze | Should -Be 0
    }
}