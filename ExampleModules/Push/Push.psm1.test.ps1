$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
Import-Module -Name $ScriptDir\Push.psm1
 
Describe "Push" {
    It "Test if code is pushed." {
        Push | Should -Be 0
    }
}