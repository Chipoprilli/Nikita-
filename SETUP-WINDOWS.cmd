@echo off
cd /d "%~dp0"
echo Start MySQL in XAMPP before continuing.
if not exist "config.php" copy "config.example.php" "config.php" >nul
"C:\xampp\mysql\bin\mysql.exe" -h 127.0.0.1 -u root -e "CREATE DATABASE IF NOT EXISTS kofein_prilukov CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
if errorlevel 1 goto failed
"C:\xampp\php\php.exe" database\migrate.php
if errorlevel 1 goto failed
echo Setup complete. Run START-SITE.cmd and open http://127.0.0.1:8001
pause
exit /b 0
:failed
echo Setup failed. Check MySQL and config.php. See README.md for password setup.
pause
exit /b 1
