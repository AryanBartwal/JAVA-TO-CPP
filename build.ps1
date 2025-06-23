#!/usr/bin/env pwsh
# Build script for Java-to-C++ converter

param(
    [switch]$Clean,
    [switch]$Test,
    [string]$JavaFile = "test.java"
)

if ($Clean) {
    Write-Host "🧹 Cleaning build artifacts..." -ForegroundColor Yellow
    Remove-Item java2cpp.exe, *.cpp, *.exe, lex.yy.c, parser.tab.* -ErrorAction SilentlyContinue
    Write-Host "✅ Clean complete!" -ForegroundColor Green
    return
}

Write-Host "🔨 Building Java-to-C++ converter..." -ForegroundColor Yellow

# Generate parser
Write-Host "  📝 Generating parser..." -ForegroundColor Cyan
win_bison -d parser.y

# Generate lexer
Write-Host "  📝 Generating lexer..." -ForegroundColor Cyan
win_flex lexer.l

# Compile converter
Write-Host "  ⚙️ Compiling converter..." -ForegroundColor Cyan
g++ lex.yy.c parser.tab.c -o java2cpp.exe

if (Test-Path java2cpp.exe) {
    Write-Host "✅ Build successful!" -ForegroundColor Green
    
    if ($Test) {
        Write-Host "`n🧪 Testing with $JavaFile..." -ForegroundColor Yellow
        if (Test-Path $JavaFile) {
            Get-Content $JavaFile | ./java2cpp.exe | Set-Content -Encoding ascii output.cpp
            g++ output.cpp -o output.exe
            if (Test-Path output.exe) {
                Write-Host "✅ Test compilation successful!" -ForegroundColor Green
                Write-Host "🏃 Running test program..." -ForegroundColor Cyan
                ./output.exe
            } else {
                Write-Host "❌ Test compilation failed!" -ForegroundColor Red
            }
        } else {
            Write-Host "❌ Test file $JavaFile not found!" -ForegroundColor Red
        }
    }
} else {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    exit 1
}
