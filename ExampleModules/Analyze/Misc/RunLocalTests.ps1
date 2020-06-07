invoke-pester -script ..\Analyze.test.ps1 -CodeCoverage `
@{Path = '..\Analyze.psm1'; Function = 'Analyze'}