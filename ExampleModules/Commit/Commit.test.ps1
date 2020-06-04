$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
Import-Module -Name $ScriptDir\Commit.psm1
 
Describe "Commit" {
    It "Test if code is committed." {
        Commit | Should -Be 0
    }
}