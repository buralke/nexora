# Fetches remote refs and reports sync status without merging or changing files.
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
Push-Location $repoRoot
try {
    git rev-parse --is-inside-work-tree
    if ($LASTEXITCODE -ne 0) { throw 'This folder is not a Git repository.' }
    git fetch origin
    if ($LASTEXITCODE -ne 0) { throw 'Fetch failed; remote status was not verified.' }
    git status --short --branch --untracked-files=all
    if ($LASTEXITCODE -ne 0) { throw 'Unable to read repository status.' }
    $upstream = git rev-parse --abbrev-ref --symbolic-full-name '@{upstream}' 2>$null
    if ($LASTEXITCODE -ne 0) { throw 'No upstream configured for this branch.' }
    Write-Output "Comparing HEAD with $upstream (local-only, remote-only):"
    git rev-list --left-right --count "HEAD...$upstream"
    if ($LASTEXITCODE -ne 0) { throw 'Unable to compare commits.' }
}
finally {
    Pop-Location
}
