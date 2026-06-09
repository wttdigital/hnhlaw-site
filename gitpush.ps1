$dir = 'C:\Users\shawn\OneDrive - WTT Digital\GEO Clients\HnH Law\hnhlaw-site'
Set-Location $dir

# Remove lock file
$lock = Join-Path $dir '.git\index.lock'
if (Test-Path $lock) { Remove-Item -Force $lock; Write-Host "Removed lock" }

# Git add
git add -A
Write-Host "Add exit: $LASTEXITCODE"

# Git commit
git commit -m "fix: standardize nav/header across all 12 pages"
Write-Host "Commit exit: $LASTEXITCODE"

# Git push
git push origin main
Write-Host "Push exit: $LASTEXITCODE"

Read-Host "Press Enter to close"
