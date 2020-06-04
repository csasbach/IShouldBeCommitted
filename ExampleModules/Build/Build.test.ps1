$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
Import-Module -Name $ScriptDir\Build.psm1
 
Describe "Build" {
    It "Test if code is built." {
        Build | Should -Be 0
    }
}