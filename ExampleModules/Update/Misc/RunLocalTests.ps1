invoke-pester -script ..\Update.psm1.test.ps1 -CodeCoverage `
@{Path = '..\Update.psm1'; Function = 'Update'}