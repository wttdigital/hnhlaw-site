@echo off
cd /d "%~dp0"
echo ============================================
echo  H^&H Law - Deploy to GitHub Pages
echo ============================================
if exist ".git\index.lock" del /f ".git\index.lock"
echo.
echo [1/3] Staging changes...
git add -A
echo [2/3] Committing...
git commit -m "Restructure to multi-page static site; fix footer contrast"
echo.
echo [3/3] Pushing to GitHub...
git push origin main
echo.
echo ============================================
echo  Finished - review the output above for errors.
echo ============================================
pause
