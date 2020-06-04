$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
Import-Module -Name $ScriptDir\Test.psm1
 
Describe "Test" {
    It "Test if code is tested." {
        Test | Should -Be 0
    }
}