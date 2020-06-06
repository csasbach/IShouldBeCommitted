Commands:
---------
```
invoke-pester -script .\Update.test.ps1 -CodeCoverage `
@{Path = 'Update.psm1'; Function = 'Update'}
```