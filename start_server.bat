@echo off
echo Java to C++ Converter - Web Frontend
echo =====================================
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    echo.
    pause
    exit /b 1
)

REM Check if package.json exists
if not exist package.json (
    echo ERROR: package.json not found
    echo Please make sure you are in the correct directory
    echo.
    pause
    exit /b 1
)

REM Install dependencies if node_modules doesn't exist
if not exist node_modules (
    echo Installing dependencies...
    echo.
    npm install
    if errorlevel 1 (
        echo ERROR: Failed to install dependencies
        echo.
        pause
        exit /b 1
    )
    echo.
    echo Dependencies installed successfully!
    echo.
)

REM Check if java2cpp.exe exists
if not exist java2cpp.exe (
    echo WARNING: java2cpp.exe not found in current directory
    echo The converter may not work properly without it
    echo.
)

echo Starting the web server...
echo.
echo The web interface will be available at:
echo http://localhost:3000
echo.
echo Press Ctrl+C to stop the server
echo.

REM Start the server
npm start
