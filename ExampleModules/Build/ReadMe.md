Build
======
A module that defines an implementation for building the code in the repository.

Commands:
---------
```
invoke-pester -script .\Build.test.ps1 -CodeCoverage `
@{Path = 'Build.psm1'; Function = 'Build'}
```