#!/bin/bash

# Build script for Vercel deployment
echo "Building Java to C++ converter..."

# Check if flex and bison are available
if ! command -v flex &> /dev/null; then
    echo "Installing flex..."
    apt-get update && apt-get install -y flex
fi

if ! command -v bison &> /dev/null; then
    echo "Installing bison..."
    apt-get update && apt-get install -y bison
fi

if ! command -v gcc &> /dev/null; then
    echo "Installing gcc..."
    apt-get update && apt-get install -y gcc
fi

# Build the converter
echo "Generating parser..."
bison -d parser.y

echo "Generating lexer..."
flex lexer.l

echo "Compiling converter..."
gcc -o java2cpp parser.tab.c lex.yy.c -lfl

echo "Build complete!"
