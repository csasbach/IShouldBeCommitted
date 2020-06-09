invoke-pester -script ..\Commit.psm1.test.ps1 -CodeCoverage `
@{Path = '..\Commit.psm1'; Function = 'Commit'}