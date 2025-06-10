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
2. Convert Java to C++ (PowerShell, recommended):

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

# Java-to-C++ Array Converter

This project converts Java code (including 1D and 2D arrays, assignments, and loops) to valid C++ code.

## Features
- Converts Java array declarations (e.g., `int[] arr = new int[5];`, `int[][] mat = new int[2][3];`) to valid C++ (`int arr[5];`, `int mat[2][3];`).
- Handles array assignments and accesses.
- Supports for-loops, nested loops, and printing array elements.
- Output C++ code is ready to compile and run with g++.

## Usage
1. Place your Java file (e.g., `test_array.java`) in the project directory.
2. Run the converter:
   ```
   Get-Content test_array.java | .\java2cpp.exe
   ```
3. Compile the generated C++ code:
   ```
   g++ -o output_array.exe output.cpp
   ```
4. Run the executable:
   ```
   .\output_array.exe
   ```

## Example
Java input:
```java
int[] arr = new int[5];
for (int i = 0; i < 5; i++) arr[i] = i * 2;
```
C++ output:
```cpp
int arr[5];
for (int i = 0; i < 5; i++) arr[i] = i * 2;
```

## Limitations
- Only supports basic Java syntax (no objects, no advanced collections).
- Only 1D and 2D arrays of primitive types are supported.
- No support for Java ArrayList, String[], or user-defined classes.

## Recent Changes
- Fixed grammar and code generation for 1D and 2D arrays.
- Output C++ code is now always valid for array logic.
- Example test files: `test_array.java`, `output.cpp`.

---

For more features or bug reports, open an issue or contact the maintainer.
