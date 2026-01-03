@echo off
REM ==================================================
REM SysTrack Offline SYSTEM-WIDE Installation Script
REM Python 3.11 – Windows
REM ==================================================

REM Force working directory to this BAT file location
cd /d "%~dp0"

echo =====================================
echo SysTrack SYSTEM-WIDE Offline Install
echo =====================================
echo.

REM Must be run as Administrator
net session >nul 2>&1
if errorlevel 1 (
    echo ERROR: Please run this script as Administrator
    pause
    exit /b 1
)

REM Ensure requirements.txt exists
if not exist "requirements.txt" (
    echo ERROR: requirements.txt not found
    pause
    exit /b 1
)

REM Verify Python
"C:\Program Files\Python311\python.exe" --version
if errorlevel 1 (
    echo ERROR: Python 3.11 not found
    pause
    exit /b 1
)

echo.
echo Installing packages SYSTEM-WIDE from offline cache...
echo.

"C:\Program Files\Python311\python.exe" -m pip install ^
 --no-index ^
 --find-links=. ^
 -r requirements.txt

if errorlevel 1 (
    echo.
    echo =====================================
    echo ERROR: Installation failed
    echo =====================================
    pause
    exit /b 1
)

echo.
echo =====================================
echo Verifying SYSTEM-WIDE installation
echo =====================================

"C:\Program Files\Python311\python.exe" -c "import requests; print('requests OK:', requests.__file__)"
"C:\Program Files\Python311\python.exe" -c "import pandas; print('pandas OK:', pandas.__file__)"
"C:\Program Files\Python311\python.exe" -c "import openpyxl; print('openpyxl OK:', openpyxl.__file__)"
"C:\Program Files\Python311\python.exe" -c "import numpy; print('numpy OK:', numpy.__file__)"

echo.
echo =====================================
echo ✅ SYSTEM-WIDE Installation Complete
echo =====================================
pause
