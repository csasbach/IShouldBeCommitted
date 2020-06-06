Commands:
---------
```
invoke-pester -script .\Build.test.ps1 -CodeCoverage `
@{Path = 'Build.psm1'; Function = 'Build'}
```