@echo off
cd /d "%~dp0"
echo Removing any stale git lock files...
del /f /q ".git\index.lock" 2>nul
del /f /q ".git\HEAD.lock" 2>nul
del /f /q ".git\ORIG_HEAD.lock" 2>nul
del /f /q ".git\objects\maintenance.lock" 2>nul

echo.
echo Staging changes...
git add -A

echo.
echo Committing...
git commit -m "Replace direct GA4 gtag.js with Google Tag Manager (GTM-KWQKSR54) across all pages"

echo.
echo Pushing to origin/main...
git push origin main

echo.
echo Done. Press any key to close.
pause >nul
