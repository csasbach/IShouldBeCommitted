invoke-pester -script .\IShouldBeCommitted.test.ps1 -CodeCoverage `
@{Path = 'IShouldBeCommitted.psm1'; Function = 'TryUpdate'}, `
@{Path = 'IShouldBeCommitted.psm1'; Function = 'TryBuild'}, `
@{Path = 'IShouldBeCommitted.psm1'; Function = 'TryAnalyze'}, `
@{Path = 'IShouldBeCommitted.psm1'; Function = 'TryTest'}, `
@{Path = 'IShouldBeCommitted.psm1'; Function = 'TryCommit'}, `
@{Path = 'IShouldBeCommitted.psm1'; Function = 'TryPush'}