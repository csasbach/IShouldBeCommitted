invoke-pester -script ..\Test.psm1.test.ps1 -CodeCoverage `
@{Path = '..\Test.psm1'; Function = 'Test'}