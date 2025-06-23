# Java-to-C++ Converter

A comprehensive Java-to-C++ converter built with Flex/Bison that converts Java code to compilable, idiomatic C++ code.

## 🚀 Features

### Core Language Support
- ✅ **Classes and Methods**: Public static methods, main method
- ✅ **Data Types**: int, char, float, double, boolean
- ✅ **Variables**: Declaration, assignment, and usage
- ✅ **Control Structures**: if/else, for loops, while loops, do-while loops
- ✅ **Switch Statements**: Full switch/case/default with proper scoping
- ✅ **Arrays**: Declaration, assignment, indexing (`int[] arr = new int[5]`)
- ✅ **Expressions**: Arithmetic, comparison, logical operations
- ✅ **String Operations**: Automatic conversion of Java string concatenation to C++ streams

### Array Support
- **1D Arrays**: `int[] arr = new int[5];` → `int arr[5];`
- **Array Assignment**: `arr[i] = value;` → `arr[i] = value;`
- **Array Indexing**: `arr[i]` in expressions and print statements
- **Dynamic Size**: `new int[expression]` with variable expressions

### Output Generation
- **Standalone Functions**: Converts Java methods to C++ functions (not class methods)
- **Proper Headers**: Automatically includes `<iostream>` and `using namespace std;`
- **Clean Code**: Properly formatted, compilable C++ with correct scoping

## 📋 Prerequisites

- **Windows OS**
- **[WinFlexBison](https://github.com/lexxmark/winflexbison)**: win_flex and win_bison
- **MinGW g++**: For compiling generated C++ code
- **PowerShell**: For running build commands

## 🔧 Installation & Build

1. **Clone the repository**:
```powershell
git clone <your-repo-url>
cd java-to-cpp
```

2. **Build the converter**:
```powershell
win_bison -d parser.y
win_flex lexer.l
g++ lex.yy.c parser.tab.c -o java2cpp.exe
```

## 📖 Usage

### Basic Usage
```powershell
# Convert Java to C++
Get-Content YourFile.java | ./java2cpp.exe | Set-Content -Encoding ascii output.cpp

# Compile the C++ code
g++ output.cpp -o program.exe

# Run the program
./program.exe
```

### Example Conversion

**Input Java (`test.java`)**:
```java
public class Test {
    public static void main(String[] args) {
        int[] arr = new int[3];
        for (int i = 0; i < 3; i++) {
            arr[i] = i * 2;
            System.out.println("arr[" + i + "] = " + arr[i]);
        }
    }
}
```

**Generated C++ (`output.cpp`)**:
```cpp
#include <iostream>
using namespace std;

int main() {
    int arr[3];
    for (int i = 0; i < 3; i++) {
        arr[i] = i * 2;
        cout << "arr[" << i << "] = " << arr[i] << endl;
    }
    return 0;
}
```

## 🧪 Test Files

The repository includes comprehensive test files:

- **`test.java`**: Complete test with all supported features
- **`ArrayTest.java`**: Simple array operations test
- **`test_working.java`**: Verified working example
- **`test_array.java`**: Array-specific test cases

## 📁 Project Structure

```
java-to-cpp/
├── lexer.l           # Flex lexical analyzer
├── parser.y          # Bison parser grammar
├── test.java         # Comprehensive test file
├── ArrayTest.java    # Array operations test
├── test_working.java # Verified working example
├── Makefile          # Build automation
└── README.md         # This documentation
```

## 🎯 Supported Java Features

### ✅ Fully Supported
- Public classes and static methods
- Primitive data types (int, char, float, double)
- Variable declarations and assignments
- Array declarations and operations
- Control flow (if/else, loops, switch/case)
- Arithmetic and logical expressions
- System.out.println with string concatenation
- Method calls with parameters

### ❌ Not Supported
- Object-oriented features (inheritance, polymorphism)
- Dynamic data structures (ArrayList, HashMap)
- Exception handling (try/catch)
- Package imports and namespaces
- Scanner input or file I/O
- String class methods
- Advanced generics

## 🔍 Advanced Examples

### Complex Switch Statement
```java
switch (value) {
    case 1:
        int x = 10;
        System.out.println("Case 1: " + x);
        break;
    case 2:
        for (int i = 0; i < 3; i++) {
            System.out.println("Loop: " + i);
        }
        break;
    default:
        int[] arr = new int[5];
        arr[0] = 100;
        System.out.println("Default: " + arr[0]);
}
```

### Nested Loops with Arrays
```java
int[][] matrix = new int[3][3];
for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
        matrix[i][j] = i * j;
        System.out.println("matrix[" + i + "][" + j + "] = " + matrix[i][j]);
    }
}
```

## 🚀 Development & Contributing

### Building from Source
```powershell
# Generate parser
win_bison -d parser.y

# Generate lexer  
win_flex lexer.l

# Compile converter
g++ -o java2cpp.exe parser.tab.c lex.yy.c

# Test with example
Get-Content test.java | ./java2cpp.exe | Set-Content -Encoding ascii test.cpp
g++ test.cpp -o test.exe
./test.exe
```

### Clean Build
```powershell
# Remove generated files
Remove-Item lex.yy.c, parser.tab.c, parser.tab.h, java2cpp.exe -ErrorAction SilentlyContinue

# Remove output files
Remove-Item *.cpp, *.exe -ErrorAction SilentlyContinue
```

## 📋 Git Workflow

```powershell
# Add source files to git
git add lexer.l parser.y *.java README.md Makefile

# Clean build artifacts before committing
Remove-Item java2cpp.exe, *.cpp, *.exe, lex.yy.c, parser.tab.* -ErrorAction SilentlyContinue

# Commit and push
git commit -m "Update Java-to-C++ converter with array support"
git push origin main
```

## 🐛 Known Issues & Limitations

1. **Parser Conflicts**: The grammar has some shift/reduce conflicts that don't affect functionality
2. **String Literals**: Complex escape sequences may not convert perfectly
3. **Method Overloading**: Not supported (Java methods become C++ functions)
4. **Static Context**: All generated code runs in global scope (no class context)

## 📈 Version History

- **v2.0**: Added comprehensive array support and assignment operations
- **v1.5**: Improved switch/case statement handling with proper scoping
- **v1.2**: Fixed string concatenation conversion to C++ streams
- **v1.0**: Initial release with basic Java-to-C++ conversion

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Add test cases for new features
4. Ensure all tests pass
5. Submit a pull request

## 📄 License

This project is open source. Feel free to use, modify, and distribute.

---

**For bug reports or feature requests, please open an issue on GitHub.**
