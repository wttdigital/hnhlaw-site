@echo off
cd /d "%~dp0"
echo ============================================
echo  H^&H Law - Deploy to GitHub Pages
echo ============================================
if exist ".git\index.lock" del /f ".git\index.lock"
if exist ".git\HEAD.lock" del /f ".git\HEAD.lock"
if exist ".git\config.lock" del /f ".git\config.lock"
echo.
echo [1/3] Staging changes...
git add -A
echo [2/3] Committing...
git commit -m "feat: center logo in nav, phone/email inline to right of logo"
echo.
echo [3/3] Pushing to GitHub...
git push origin main
echo.
echo ============================================
echo  Finished - review the output above for errors.
echo ============================================
pause
