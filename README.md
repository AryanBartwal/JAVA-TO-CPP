# Java-to-C++ Converter

## How to Use

This project converts a subset of Java code to C++ using a Flex/Bison-based converter.

### Prerequisites
- Windows OS
- [win_flex](https://github.com/lexxmark/winflexbison) and [win_bison](https://github.com/lexxmark/winflexbison) (or compatible Flex/Bison for Windows)
- g++ (MinGW or similar)
- git (for cloning and version control)

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
- `Makefile`: (optional) for building with `make` if you have it
- `test.java`: Example Java file
- `README.md`: This file

## Clean Up
- Build artifacts (`java2cpp.exe`, `a.cpp`, `a.exe`) and temp files are not included in the repository.
- To clean up, simply delete those files if present.

## Version Control
To push your changes to git:

```powershell
git add lexer.l parser.y README.md test.java Makefile
# Remove build artifacts and temp files before committing
if (Test-Path java2cpp.exe) { Remove-Item java2cpp.exe }
if (Test-Path a.cpp) { Remove-Item a.cpp }
if (Test-Path a.exe) { Remove-Item a.exe }
git commit -m "Update: clean up and add instructions"
git push
```
