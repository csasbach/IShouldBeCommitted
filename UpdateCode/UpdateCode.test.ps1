$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
Import-Module -Name $ScriptDir\UpdateCode.psm1
 
Describe "test UpdateCode" {
    It "Test if code is updated." {
        UpdateCode | Should -Be 0
    }
}