I Should Be Committed
=====================
A framework for continuous scripted updating, building, static analysis, testing, committing, and pushing of code

Commands:
---------
```
.\Misc\uninstall-pester.ps1
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 
Install-Module PowerShellGet -RequiredVersion 2.2.4 -SkipPublisherCheck
Install-module -name Pester -RequiredVersion 4.10.1
invoke-pester -script .\IShouldBeCommitted.test.ps1 -CodeCoverage `
@{Path = 'IShouldBeCommitted.psm1'; Function = 'TryUpdate'}, `
@{Path = 'IShouldBeCommitted.psm1'; Function = 'TryBuild'}, `
@{Path = 'IShouldBeCommitted.psm1'; Function = 'TryAnalyze'}, `
@{Path = 'IShouldBeCommitted.psm1'; Function = 'TryTest'}, `
@{Path = 'IShouldBeCommitted.psm1'; Function = 'TryCommit'}, `
@{Path = 'IShouldBeCommitted.psm1'; Function = 'TryPush'}