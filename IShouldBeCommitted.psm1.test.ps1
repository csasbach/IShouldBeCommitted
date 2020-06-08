$ScriptDir = Split-Path -parent $MyInvocation.MyCommand.Path

Describe "Importing the module" {
    Context "When the module is imported without setting config path" {
        Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1
        InModuleScope IShouldBeCommitted {
            It "sets config path to the default config path" {
                $script:configPath | Should -Be $script:defaultConfigPath
            }
        }
        Remove-Module  IShouldBeCommitted
    }
    Context "When the module is imported without setting config path and default config does not exist" {
        Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1
        InModuleScope IShouldBeCommitted {
            $global:defaultConfigPath = $script:defaultConfigPath
        }
        Remove-Module  IShouldBeCommitted
        $content = Get-Content $global:defaultConfigPath -Raw
        Remove-Item $global:defaultConfigPath
        Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1
        New-Item $global:defaultConfigPath
        Set-Content $global:defaultConfigPath "$content" -NoNewLine
        InModuleScope IShouldBeCommitted {
            It "sets config to an empty object" {
                -not $script:config.psobject.Properties.GetEnumerator().MoveNext() | Should -Be $True
            }
        }
        Remove-Module  IShouldBeCommitted
    }
    Context "When the module is imported with config path set in argument list" {
        $global:expectedConfigPath = "$($ScriptDir)\IShouldBeCommitted.psm1.mock.config.json"
        New-Item $global:expectedConfigPath
        Set-Content $global:expectedConfigPath '{}' -NoNewLine
        Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1 -ArgumentList $global:expectedConfigPath
        InModuleScope IShouldBeCommitted {
            It "sets config path to the expected config path" {
                $script:configPath | Should -Be $global:expectedConfigPath
            }
        }
        Remove-Module  IShouldBeCommitted
        Remove-Item $global:expectedConfigPath
        Remove-Variable expectedConfigPath -Scope 'global'
    }
}

Describe "Run" {    
    Context "When the module is imported with no config values" {
        $global:expectedConfigPath = "$($ScriptDir)\IShouldBeCommitted.psm1.mock.config.json"
        New-Item $global:expectedConfigPath
        Set-Content $global:expectedConfigPath '{}' -NoNewLine
        Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1 -ArgumentList $global:expectedConfigPath
        InModuleScope IShouldBeCommitted {
            Context "When Run is called with no switches" {
                Mock TryUpdate {return 0} -Verifiable
                Mock TryBuild {return 0} -Verifiable
                Mock TryAnalyze {return 0} -Verifiable
                Mock TryTest {return 0} -Verifiable
                Mock TryCommit {return 0} -Verifiable
                Mock TryPush {return 0} -Verifiable
        
                Run
        
                It "calls all Try methods" {
                    Assert-VerifiableMock
                }
            }
            Context "When Run is called with dontUpdate switch" {
                Mock TryUpdate {return 0} -Verifiable
                Mock TryBuild {return 0} -Verifiable
                Mock TryAnalyze {return 0} -Verifiable
                Mock TryTest {return 0} -Verifiable
                Mock TryCommit {return 0} -Verifiable
                Mock TryPush {return 0} -Verifiable
        
                Run -dontUpdate
        
                It "calls all Try methods except TryUpdate" {
                    Assert-MockCalled -CommandName TryUpdate -Times 0
                    Assert-MockCalled -CommandName TryBuild -Times 1
                    Assert-MockCalled -CommandName TryAnalyze -Times 1
                    Assert-MockCalled -CommandName TryTest -Times 1
                    Assert-MockCalled -CommandName TryCommit -Times 1
                    Assert-MockCalled -CommandName TryPush -Times 1
                }
            }
            Context "When Run is called with dontBuild switch" {
                Mock TryUpdate {return 0} -Verifiable
                Mock TryBuild {return 0} -Verifiable
                Mock TryAnalyze {return 0} -Verifiable
                Mock TryTest {return 0} -Verifiable
                Mock TryCommit {return 0} -Verifiable
                Mock TryPush {return 0} -Verifiable
        
                Run -dontBuild
        
                It "calls all Try methods except TryBuild" {
                    Assert-MockCalled -CommandName TryUpdate -Times 1
                    Assert-MockCalled -CommandName TryBuild -Times 0
                    Assert-MockCalled -CommandName TryAnalyze -Times 1
                    Assert-MockCalled -CommandName TryTest -Times 1
                    Assert-MockCalled -CommandName TryCommit -Times 1
                    Assert-MockCalled -CommandName TryPush -Times 1
                }
            }
            Context "When Run is called with dontAnalyze switch" {
                Mock TryUpdate {return 0} -Verifiable
                Mock TryBuild {return 0} -Verifiable
                Mock TryAnalyze {return 0} -Verifiable
                Mock TryTest {return 0} -Verifiable
                Mock TryCommit {return 0} -Verifiable
                Mock TryPush {return 0} -Verifiable
        
                Run -dontAnalyze
        
                It "calls all Try methods except TryAnalyze" {
                    Assert-MockCalled -CommandName TryUpdate -Times 1
                    Assert-MockCalled -CommandName TryBuild -Times 1
                    Assert-MockCalled -CommandName TryAnalyze -Times 0
                    Assert-MockCalled -CommandName TryTest -Times 1
                    Assert-MockCalled -CommandName TryCommit -Times 1
                    Assert-MockCalled -CommandName TryPush -Times 1
                }
            }
            Context "When Run is called with dontTest switch" {
                Mock TryUpdate {return 0} -Verifiable
                Mock TryBuild {return 0} -Verifiable
                Mock TryAnalyze {return 0} -Verifiable
                Mock TryTest {return 0} -Verifiable
                Mock TryCommit {return 0} -Verifiable
                Mock TryPush {return 0} -Verifiable
        
                Run -dontTest
        
                It "calls all Try methods except TryTest" {
                    Assert-MockCalled -CommandName TryUpdate -Times 1
                    Assert-MockCalled -CommandName TryBuild -Times 1
                    Assert-MockCalled -CommandName TryAnalyze -Times 1
                    Assert-MockCalled -CommandName TryTest -Times 0
                    Assert-MockCalled -CommandName TryCommit -Times 1
                    Assert-MockCalled -CommandName TryPush -Times 1
                }
            }
            Context "When Run is called with dontCommit switch" {
                Mock TryUpdate {return 0} -Verifiable
                Mock TryBuild {return 0} -Verifiable
                Mock TryAnalyze {return 0} -Verifiable
                Mock TryTest {return 0} -Verifiable
                Mock TryCommit {return 0} -Verifiable
                Mock TryPush {return 0} -Verifiable
        
                Run -dontCommit
        
                It "calls all Try methods except TryCommit" {
                    Assert-MockCalled -CommandName TryUpdate -Times 1
                    Assert-MockCalled -CommandName TryBuild -Times 1
                    Assert-MockCalled -CommandName TryAnalyze -Times 1
                    Assert-MockCalled -CommandName TryTest -Times 1
                    Assert-MockCalled -CommandName TryCommit -Times 0
                    Assert-MockCalled -CommandName TryPush -Times 1
                }
            }
            Context "When Run is called with dontPush switch" {
                Mock TryUpdate {return 0} -Verifiable
                Mock TryBuild {return 0} -Verifiable
                Mock TryAnalyze {return 0} -Verifiable
                Mock TryTest {return 0} -Verifiable
                Mock TryCommit {return 0} -Verifiable
                Mock TryPush {return 0} -Verifiable
        
                Run -dontPush
        
                It "calls all Try methods except TryPush" {
                    Assert-MockCalled -CommandName TryUpdate -Times 1
                    Assert-MockCalled -CommandName TryBuild -Times 1
                    Assert-MockCalled -CommandName TryAnalyze -Times 1
                    Assert-MockCalled -CommandName TryTest -Times 1
                    Assert-MockCalled -CommandName TryCommit -Times 1
                    Assert-MockCalled -CommandName TryPush -Times 0
                }
            }
        }
        Remove-Module  IShouldBeCommitted
        Remove-Item $global:expectedConfigPath
        Remove-Variable expectedConfigPath -Scope 'global'
    }  
    Context "When the module is imported with dontUpdate set to true in config file" {
        $global:expectedConfigPath = "$($ScriptDir)\IShouldBeCommitted.psm1.mock.config.json"
        New-Item $global:expectedConfigPath
        Set-Content $global:expectedConfigPath '{ "dontUpdate" : "true" }' -NoNewLine
        Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1 -ArgumentList $global:expectedConfigPath
        InModuleScope IShouldBeCommitted {
            Mock TryUpdate {return 0} -Verifiable
            Mock TryBuild {return 0} -Verifiable
            Mock TryAnalyze {return 0} -Verifiable
            Mock TryTest {return 0} -Verifiable
            Mock TryCommit {return 0} -Verifiable
            Mock TryPush {return 0} -Verifiable
    
            Run           
        
            It "calls all Try methods except TryUpdate" {
                Assert-MockCalled -CommandName TryUpdate -Times 0
                Assert-MockCalled -CommandName TryBuild -Times 1
                Assert-MockCalled -CommandName TryAnalyze -Times 1
                Assert-MockCalled -CommandName TryTest -Times 1
                Assert-MockCalled -CommandName TryCommit -Times 1
                Assert-MockCalled -CommandName TryPush -Times 1
            }
        }
        Remove-Module  IShouldBeCommitted
        Remove-Item $global:expectedConfigPath
        Remove-Variable expectedConfigPath -Scope 'global'
    }  
    Context "When the module is imported with dontBuild set to true in config file" {
        $global:expectedConfigPath = "$($ScriptDir)\IShouldBeCommitted.psm1.mock.config.json"
        New-Item $global:expectedConfigPath
        Set-Content $global:expectedConfigPath '{ "dontBuild" : "true" }' -NoNewLine
        Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1 -ArgumentList $global:expectedConfigPath
        InModuleScope IShouldBeCommitted {
            Mock TryUpdate {return 0} -Verifiable
            Mock TryBuild {return 0} -Verifiable
            Mock TryAnalyze {return 0} -Verifiable
            Mock TryTest {return 0} -Verifiable
            Mock TryCommit {return 0} -Verifiable
            Mock TryPush {return 0} -Verifiable
    
            Run           
        
            It "calls all Try methods except TryBuild" {
                Assert-MockCalled -CommandName TryUpdate -Times 1
                Assert-MockCalled -CommandName TryBuild -Times 0
                Assert-MockCalled -CommandName TryAnalyze -Times 1
                Assert-MockCalled -CommandName TryTest -Times 1
                Assert-MockCalled -CommandName TryCommit -Times 1
                Assert-MockCalled -CommandName TryPush -Times 1
            }
        }
        Remove-Module  IShouldBeCommitted
        Remove-Item $global:expectedConfigPath
        Remove-Variable expectedConfigPath -Scope 'global'
    }  
    Context "When the module is imported with dontAnalyze set to true in config file" {
        $global:expectedConfigPath = "$($ScriptDir)\IShouldBeCommitted.psm1.mock.config.json"
        New-Item $global:expectedConfigPath
        Set-Content $global:expectedConfigPath '{ "dontAnalyze" : "true" }' -NoNewLine
        Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1 -ArgumentList $global:expectedConfigPath
        InModuleScope IShouldBeCommitted {
            Mock TryUpdate {return 0} -Verifiable
            Mock TryBuild {return 0} -Verifiable
            Mock TryAnalyze {return 0} -Verifiable
            Mock TryTest {return 0} -Verifiable
            Mock TryCommit {return 0} -Verifiable
            Mock TryPush {return 0} -Verifiable
    
            Run           
        
            It "calls all Try methods except TryAnalyze" {
                Assert-MockCalled -CommandName TryUpdate -Times 1
                Assert-MockCalled -CommandName TryBuild -Times 1
                Assert-MockCalled -CommandName TryAnalyze -Times 0
                Assert-MockCalled -CommandName TryTest -Times 1
                Assert-MockCalled -CommandName TryCommit -Times 1
                Assert-MockCalled -CommandName TryPush -Times 1
            }
        }
        Remove-Module  IShouldBeCommitted
        Remove-Item $global:expectedConfigPath
        Remove-Variable expectedConfigPath -Scope 'global'
    }  
    Context "When the module is imported with dontTest set to true in config file" {
        $global:expectedConfigPath = "$($ScriptDir)\IShouldBeCommitted.psm1.mock.config.json"
        New-Item $global:expectedConfigPath
        Set-Content $global:expectedConfigPath '{ "dontTest" : "true" }' -NoNewLine
        Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1 -ArgumentList $global:expectedConfigPath
        InModuleScope IShouldBeCommitted {
            Mock TryUpdate {return 0} -Verifiable
            Mock TryBuild {return 0} -Verifiable
            Mock TryAnalyze {return 0} -Verifiable
            Mock TryTest {return 0} -Verifiable
            Mock TryCommit {return 0} -Verifiable
            Mock TryPush {return 0} -Verifiable
    
            Run           
        
            It "calls all Try methods except TryTest" {
                Assert-MockCalled -CommandName TryUpdate -Times 1
                Assert-MockCalled -CommandName TryBuild -Times 1
                Assert-MockCalled -CommandName TryAnalyze -Times 1
                Assert-MockCalled -CommandName TryTest -Times 0
                Assert-MockCalled -CommandName TryCommit -Times 1
                Assert-MockCalled -CommandName TryPush -Times 1
            }
        }
        Remove-Module  IShouldBeCommitted
        Remove-Item $global:expectedConfigPath
        Remove-Variable expectedConfigPath -Scope 'global'
    }  
    Context "When the module is imported with dontCommit set to true in config file" {
        $global:expectedConfigPath = "$($ScriptDir)\IShouldBeCommitted.psm1.mock.config.json"
        New-Item $global:expectedConfigPath
        Set-Content $global:expectedConfigPath '{ "dontCommit" : "true" }' -NoNewLine
        Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1 -ArgumentList $global:expectedConfigPath
        InModuleScope IShouldBeCommitted {
            Mock TryUpdate {return 0} -Verifiable
            Mock TryBuild {return 0} -Verifiable
            Mock TryAnalyze {return 0} -Verifiable
            Mock TryTest {return 0} -Verifiable
            Mock TryCommit {return 0} -Verifiable
            Mock TryPush {return 0} -Verifiable
    
            Run           
        
            It "calls all Try methods except TryCommit" {
                Assert-MockCalled -CommandName TryUpdate -Times 1
                Assert-MockCalled -CommandName TryBuild -Times 1
                Assert-MockCalled -CommandName TryAnalyze -Times 1
                Assert-MockCalled -CommandName TryTest -Times 1
                Assert-MockCalled -CommandName TryCommit -Times 0
                Assert-MockCalled -CommandName TryPush -Times 1
            }
        }
        Remove-Module  IShouldBeCommitted
        Remove-Item $global:expectedConfigPath
        Remove-Variable expectedConfigPath -Scope 'global'
    }  
    Context "When the module is imported with dontPush set to true in config file" {
        $global:expectedConfigPath = "$($ScriptDir)\IShouldBeCommitted.psm1.mock.config.json"
        New-Item $global:expectedConfigPath
        Set-Content $global:expectedConfigPath '{ "dontPush" : "true" }' -NoNewLine
        Import-Module -Name $ScriptDir\IShouldBeCommitted.psm1 -ArgumentList $global:expectedConfigPath
        InModuleScope IShouldBeCommitted {
            Mock TryUpdate {return 0} -Verifiable
            Mock TryBuild {return 0} -Verifiable
            Mock TryAnalyze {return 0} -Verifiable
            Mock TryTest {return 0} -Verifiable
            Mock TryCommit {return 0} -Verifiable
            Mock TryPush {return 0} -Verifiable
    
            Run           
        
            It "calls all Try methods except TryPush" {
                Assert-MockCalled -CommandName TryUpdate -Times 1
                Assert-MockCalled -CommandName TryBuild -Times 1
                Assert-MockCalled -CommandName TryAnalyze -Times 1
                Assert-MockCalled -CommandName TryTest -Times 1
                Assert-MockCalled -CommandName TryCommit -Times 1
                Assert-MockCalled -CommandName TryPush -Times 0
            }
        }
        Remove-Module  IShouldBeCommitted
        Remove-Item $global:expectedConfigPath
        Remove-Variable expectedConfigPath -Scope 'global'
    }
}

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