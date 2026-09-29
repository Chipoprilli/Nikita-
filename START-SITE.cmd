@echo off
cd /d "%~dp0"
if not exist "C:\xampp\php\php.exe" (
  echo PHP not found at C:\xampp\php\php.exe. See README.md.
  pause
  exit /b 1
)
if not exist "config.php" copy "config.example.php" "config.php" >nul
if not exist ".sessions" mkdir ".sessions"
echo Start MySQL in XAMPP. Open http://127.0.0.1:8001
echo Keep this window open. Press Ctrl+C to stop.
"C:\xampp\php\php.exe" -d session.save_path=.sessions -S 127.0.0.1:8001 -t public public/router.php
pause
