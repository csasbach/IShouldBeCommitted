Commands:
---------
```
invoke-pester -script .\Test.test.ps1 -CodeCoverage `
@{Path = 'Test.psm1'; Function = 'Test'}
```