@echo off
setlocal enabledelayedexpansion

:: Navigate to the project directory
cd /d "C:\Users\n1cit\OneDrive - Cape Peninsula University of Technology\Documents\2KRONOS\VAULT"
if %ERRORLEVEL% neq 0 (
    echo Failed to navigate to the project directory.
    exit /b %ERRORLEVEL%
)

:: === Check for unresolved merge conflicts ===
git ls-files -u >nul 2>&1
if %ERRORLEVEL%==0 (
    echo ERROR: Merge conflicts detected.
    echo Please resolve them manually before running this script.
    exit /b 1
)

:: === Check for local changes ===
git diff --quiet
if %ERRORLEVEL% neq 0 (
    echo Detected local changes. Stashing before pulling...
    git stash
)

:: === Pull latest changes ===
echo Pulling latest changes from remote...
git pull
if %ERRORLEVEL% neq 0 (
    echo ERROR: Failed to pull changes. Resolve any issues and try again.
    exit /b %ERRORLEVEL%
)

:: === Apply stashed changes if any exist ===
git stash list | findstr "stash@{0}" >nul
if %ERRORLEVEL%==0 (
    echo Re-applying stashed changes...
    git stash pop
)

:: === Stage all changes ===
git add .
if %ERRORLEVEL% neq 0 (
    echo ERROR: Failed to stage changes.
    exit /b %ERRORLEVEL%
)

:: === Check for commit message ===
if not exist commit_message.txt (
    echo ERROR: commit_message.txt not found.
    exit /b 1
)

:: === Read commit message ===
set /p commit_message=<commit_message.txt
if "!commit_message!"=="" (
    echo ERROR: Commit message is empty.
    exit /b 1
)

:: === Commit the changes ===
git commit -m "!commit_message!"
if %ERRORLEVEL% neq 0 (
    echo ERROR: Failed to commit changes.
    exit /b %ERRORLEVEL%
)

:: === Push to remote ===
git push origin master
if %ERRORLEVEL% neq 0 (
    echo ERROR: Failed to push changes to GitHub.
    exit /b %ERRORLEVEL%
)

echo ✅ Code pulled, committed, and pushed to GitHub successfully!
