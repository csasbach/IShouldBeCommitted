$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
Import-Module -Name $ScriptDir\Update.psm1
 
Describe "Update" {
    It "Test if code is updated." {
        Update | Should -Be 0
    }
}