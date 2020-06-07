invoke-pester -script ..\Push.test.ps1 -CodeCoverage `
@{Path = '..\Push.psm1'; Function = 'Push'}