$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path
Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1
 
Describe "TryUpdate" {
    InModuleScope IShouldBeCommitted {
        Context "When Update is successfull" {
            Mock Update {return 0} -Verifiable
    
            $result = TryUpdate
    
            It "calls Update" {
                Assert-VerifiableMock
            }
            It "reports success" {
                $result | Should -Be "Successfully Updated..."
            }
        }
        Context "When Update is unsuccessful" {
            Mock Update {return 1} -Verifiable
    
            $result = TryUpdate
    
            It "calls Update" {
                Assert-VerifiableMock
            }
            It "reports failure" {
                $result | Should -Be "Failed to Update!"
            }
        }
    }
}