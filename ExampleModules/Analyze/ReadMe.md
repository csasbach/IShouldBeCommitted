Analyze
======
A module that defines an implementation for running static code analysis tools against the repository.

Commands:
---------
```
invoke-pester -script .\Analyze.test.ps1 -CodeCoverage `
@{Path = 'Analyze.psm1'; Function = 'Analyze'}
```