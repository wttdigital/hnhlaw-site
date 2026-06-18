@echo off
cd /d "%~dp0"
echo ============================================
echo  H^&H Law - Sync + Push (safe)
echo ============================================
echo.

echo [1/6] Aborting any in-progress rebase...
git rebase --abort 2>nul
echo Done.
echo.

echo [2/6] Stashing any uncommitted local changes...
git stash
echo.

echo [3/6] Pulling remote changes (no editor)...
git pull --no-edit origin main
echo.

echo [4/6] Committing any pending merge...
git commit --no-edit 2>nul
echo Done.
echo.

echo [5/6] Restoring stashed changes (if any)...
git stash pop 2>nul
echo Done.
echo.

echo [6/6] Pushing to GitHub...
git push origin main
echo.

echo ============================================
echo  Finished - review the output above.
echo ============================================
pause
