invoke-pester -script ..\Build.psm1.test.ps1 -CodeCoverage `
@{Path = '..\Build.psm1'; Function = 'Build'}