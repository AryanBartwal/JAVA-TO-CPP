@echo off
echo 🚀 Starting Java-to-C++ Converter Web Interface...
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

REM Check if node_modules exists
if not exist "node_modules" (
    echo 📦 Installing dependencies...
    npm install
    if %ERRORLEVEL% NEQ 0 (
        echo ❌ Failed to install dependencies
        pause
        exit /b 1
    )
    echo ✅ Dependencies installed successfully!
    echo.
)

echo 🌐 Starting web server...
echo.
echo The web interface will be available at:
echo 🔗 http://localhost:3000
echo.
echo Press Ctrl+C to stop the server
echo.

node server.js
