@echo off
cd /d "%~dp0"
echo ==============================
echo STEP 1: Remove lock files
echo ==============================
if exist ".git\index.lock" (
    del /f ".git\index.lock"
    echo Deleted index.lock
) else (
    echo No lock file found
)
echo.
pause

echo ==============================
echo STEP 2: git status
echo ==============================
git status
echo.
pause

echo ==============================
echo STEP 3: git add -A
echo ==============================
git add -A
echo Git add exit code: %ERRORLEVEL%
echo.
pause

echo ==============================
echo STEP 4: git status after add
echo ==============================
git status
echo.
pause

echo ==============================
echo STEP 5: git commit
echo ==============================
git commit -m "fix: standardize nav/header across all 12 pages"
echo Git commit exit code: %ERRORLEVEL%
echo.
pause

echo ==============================
echo STEP 6: git push
echo ==============================
git push origin main
echo Git push exit code: %ERRORLEVEL%
echo.
pause
