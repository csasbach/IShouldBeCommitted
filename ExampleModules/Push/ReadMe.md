Push
======
A module that defines an implementation for pushing code to the remote repository.

Commands:
---------
```
invoke-pester -script .\Push.test.ps1 -CodeCoverage `
@{Path = 'Push.psm1'; Function = 'Push'}
```