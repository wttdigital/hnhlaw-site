@echo off
cd /d "%~dp0"
echo Removing stale git lock if exists...
if exist ".git\index.lock" del /f ".git\index.lock"
echo Adding logo changes to all pages...
git add about.html attorney-austin-kim.html contact.html eb5-investor-visa.html employment-based-immigration.html family-immigration.html naturalization.html index.html
git commit -m "feat: add H&H Law logo to all pages"
echo Pushing to GitHub...
git push origin main
echo.
echo Done! Cloudflare will deploy in ~30 seconds.
pause
