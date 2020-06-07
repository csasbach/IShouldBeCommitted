invoke-pester -script .\Commit.test.ps1 -CodeCoverage `
@{Path = 'Commit.psm1'; Function = 'Commit'}