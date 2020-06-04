$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1
 
Describe "TryUpdateCode" {
    InModuleScope IShouldBeCommitted {
        Context "When UpdateCode is successfull" {
            Mock UpdateCode {return 0} -Verifiable
    
            $result = TryUpdateCode
    
            It "calls UpdateCode" {
                Assert-VerifiableMock
            }
            It "reports success" {
                $result | Should -Be "Successfully updated code..."
            }
        }
        Context "When UpdateCode is unsuccessful" {
            Mock UpdateCode {return 1} -Verifiable
    
            $result = TryUpdateCode
    
            It "calls UpdateCode" {
                Assert-VerifiableMock
            }
            It "reports failure" {
                $result | Should -Be "Failed to update code!"
            }
        }
    }
}