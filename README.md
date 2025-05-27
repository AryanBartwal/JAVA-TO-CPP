# Java-to-C++ Converter

## How to Use

This project converts a subset of Java code to C++ using a Flex/Bison-based converter.

### Prerequisites
- Windows OS
- [win_flex](https://github.com/lexxmark/winflexbison) and [win_bison](https://github.com/lexxmark/winflexbison) (or compatible Flex/Bison for Windows)
- g++ (MinGW or similar)

### Build Instructions
1. Open PowerShell in this folder.
2. Run the following commands to build the converter:

```powershell
win_bison -d parser.y
win_flex lexer.l
g++ lex.yy.c parser.tab.c -o java2cpp.exe
```

### Usage
1. Place your Java file (e.g., `test.java`) in this folder.
2. Convert Java to C++:

```powershell
Get-Content test.java | ./java2cpp.exe | Set-Content -Encoding ascii a.cpp
```

3. Compile the generated C++ code:

```powershell
g++ a.cpp -o a.exe
```

4. Run the C++ executable:

```powershell
./a.exe
```

### Notes
- Only a subset of Java is supported (no imports, no Scanner input, etc.).
- See `test.java` for an example.

---

## Files
- `lexer.l`, `parser.y`: Flex/Bison source for the converter
- `java2cpp.exe`: The converter executable
- `test.java`: Example Java file
- `a.cpp`: Generated C++ file
- `a.exe`: Compiled C++ executable

## Clean Up
Unneeded files (build artifacts, temp files) are not included in the repository.
