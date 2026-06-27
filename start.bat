@echo off
title Kwara Poly Fees System
color 0A
echo.
echo  ========================================
echo    KWARA STATE POLYTECHNIC, ILORIN
echo    School Fees Recording System
echo  ========================================
echo.

REM Check Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed!
    echo Download from: https://python.org/downloads
    pause
    exit
)
echo [OK] Python found
python --version

cd /d "%~dp0"

echo.
echo Starting server...
echo Open http://localhost:8080/login.html in your browser
echo.
start "" http://localhost:8080/login.html
python -m http.server 8080

pause
