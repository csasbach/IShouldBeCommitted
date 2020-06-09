invoke-pester -script ..\Push.psm1.test.ps1 -CodeCoverage `
@{Path = '..\Push.psm1'; Function = 'Push'}