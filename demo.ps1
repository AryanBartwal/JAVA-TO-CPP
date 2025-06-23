#!/usr/bin/env pwsh
# Demo script for Java-to-C++ converter

Write-Host "🚀 Java-to-C++ Converter Demo" -ForegroundColor Green
Write-Host "==============================" -ForegroundColor Green

# Build the converter
Write-Host "`n📦 Building converter..." -ForegroundColor Yellow
win_bison -d parser.y
win_flex lexer.l
g++ lex.yy.c parser.tab.c -o java2cpp.exe

if (Test-Path java2cpp.exe) {
    Write-Host "✅ Converter built successfully!" -ForegroundColor Green
} else {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    exit 1
}

# Test with ArrayTest.java
Write-Host "`n🧪 Testing with ArrayTest.java..." -ForegroundColor Yellow
Write-Host "Input Java code:" -ForegroundColor Cyan
Get-Content ArrayTest.java

Write-Host "`n🔄 Converting to C++..." -ForegroundColor Yellow
Get-Content ArrayTest.java | ./java2cpp.exe | Set-Content -Encoding ascii demo.cpp

Write-Host "`nGenerated C++ code:" -ForegroundColor Cyan
Get-Content demo.cpp

Write-Host "`n⚙️ Compiling C++ code..." -ForegroundColor Yellow
g++ demo.cpp -o demo.exe

if (Test-Path demo.exe) {
    Write-Host "✅ C++ compilation successful!" -ForegroundColor Green
    
    Write-Host "`n🏃 Running the program..." -ForegroundColor Yellow
    Write-Host "Output:" -ForegroundColor Cyan
    ./demo.exe
    
    Write-Host "`n🎉 Demo completed successfully!" -ForegroundColor Green
} else {
    Write-Host "❌ C++ compilation failed!" -ForegroundColor Red
}

# Clean up demo files
Write-Host "`n🧹 Cleaning up demo files..." -ForegroundColor Yellow
Remove-Item demo.cpp, demo.exe -ErrorAction SilentlyContinue
Write-Host "✅ Demo cleanup complete!" -ForegroundColor Green
