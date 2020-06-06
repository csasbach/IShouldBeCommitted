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
 
Describe "TryBuild" {
    InModuleScope IShouldBeCommitted {
        Context "When Build is successfull" {
            Mock Build {return 0} -Verifiable
    
            $result = TryBuild
    
            It "calls Build" {
                Assert-VerifiableMock
            }
            It "reports success" {
                $result | Should -Be "Successfully Built..."
            }
        }
        Context "When Build is unsuccessful" {
            Mock Build {return 1} -Verifiable
    
            $result = TryBuild
    
            It "calls Build" {
                Assert-VerifiableMock
            }
            It "reports failure" {
                $result | Should -Be "Failed to Build!"
            }
        }
    }
}
 
Describe "TryAnalyze" {
    InModuleScope IShouldBeCommitted {
        Context "When Analyze is successfull" {
            Mock Analyze {return 0} -Verifiable
    
            $result = TryAnalyze
    
            It "calls Analyze" {
                Assert-VerifiableMock
            }
            It "reports success" {
                $result | Should -Be "Successfully Analyzed..."
            }
        }
        Context "When Analyze is unsuccessful" {
            Mock Analyze {return 1} -Verifiable
    
            $result = TryAnalyze
    
            It "calls Analyze" {
                Assert-VerifiableMock
            }
            It "reports failure" {
                $result | Should -Be "Failed to Analyze!"
            }
        }
    }
}
 
Describe "TryTest" {
    InModuleScope IShouldBeCommitted {
        Context "When Test is successfull" {
            Mock Test {return 0} -Verifiable
    
            $result = TryTest
    
            It "calls Test" {
                Assert-VerifiableMock
            }
            It "reports success" {
                $result | Should -Be "Successfully Tested..."
            }
        }
        Context "When Test is unsuccessful" {
            Mock Test {return 1} -Verifiable
    
            $result = TryTest
    
            It "calls Test" {
                Assert-VerifiableMock
            }
            It "reports failure" {
                $result | Should -Be "Failed to Test!"
            }
        }
    }
}
 
Describe "TryCommit" {
    InModuleScope IShouldBeCommitted {
        Context "When Commit is successfull" {
            Mock Commit {return 0} -Verifiable
    
            $result = TryCommit
    
            It "calls Commit" {
                Assert-VerifiableMock
            }
            It "reports success" {
                $result | Should -Be "Successfully Committed..."
            }
        }
        Context "When Commit is unsuccessful" {
            Mock Commit {return 1} -Verifiable
    
            $result = TryCommit
    
            It "calls Commit" {
                Assert-VerifiableMock
            }
            It "reports failure" {
                $result | Should -Be "Failed to Commit!"
            }
        }
    }
}
 
Describe "TryPush" {
    InModuleScope IShouldBeCommitted {
        Context "When Push is successfull" {
            Mock Push {return 0} -Verifiable
    
            $result = TryPush
    
            It "calls Push" {
                Assert-VerifiableMock
            }
            It "reports success" {
                $result | Should -Be "Successfully Pushed..."
            }
        }
        Context "When Push is unsuccessful" {
            Mock Push {return 1} -Verifiable
    
            $result = TryPush
    
            It "calls Push" {
                Assert-VerifiableMock
            }
            It "reports failure" {
                $result | Should -Be "Failed to Push!"
            }
        }
    }
}