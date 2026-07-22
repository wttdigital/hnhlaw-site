@echo off
cd /d "%~dp0"
echo ============================================
echo  hnhlaw-site - finish repo state cleanup
echo  (HEAD already points at the correct commit;
echo  this just clears stale lock files and syncs
echo  the index so 'git status' is accurate again)
echo ============================================
echo.
if exist ".git\index.lock" (
  del /f ".git\index.lock"
  echo Removed stale .git\index.lock
)
if exist ".git\HEAD.lock" (
  del /f ".git\HEAD.lock"
  echo Removed stale .git\HEAD.lock
)
if exist ".git\ORIG_HEAD.lock" (
  del /f ".git\ORIG_HEAD.lock"
  echo Removed stale .git\ORIG_HEAD.lock
)
if exist ".git\objects\maintenance.lock" (
  del /f ".git\objects\maintenance.lock"
  echo Removed stale .git\objects\maintenance.lock
)
echo.
echo Syncing index to HEAD (does not touch your files)...
git reset
echo.
echo --------------------------------------------
echo  Status (should be clean, or show only real
echo  differences if any exist):
echo --------------------------------------------
git status
echo.
git log --oneline -1
echo.
echo --------------------------------------------
echo  Exit code: %errorlevel%  (0 = success)
echo --------------------------------------------
pause
