invoke-pester -script ..\Analyze.psm1.test.ps1 -CodeCoverage `
@{Path = '..\Analyze.psm1'; Function = 'Analyze'}