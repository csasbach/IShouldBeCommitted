Commit
======
A module that defines an implementation for committing to the local repository.

Commands:
---------
```
invoke-pester -script .\Commit.test.ps1 -CodeCoverage `
@{Path = 'Commit.psm1'; Function = 'Commit'}
```