/**
 * JavaScript-based Java to C++ converter
 * This is a simplified version that works in serverless environments
 */

class JavaToCppConverter {
    constructor() {
        this.headerIncludes = new Set(['iostream', 'string', 'vector', 'algorithm']);
    }

    convert(javaCode) {
        try {
            let cppCode = javaCode.trim();
            
            // Remove package declarations and imports
            cppCode = cppCode.replace(/package\s+[\w.]+;\s*/g, '');
            cppCode = cppCode.replace(/import\s+[\w.*]+;\s*/g, '');
            
            // Add includes
            let includes = '#include <iostream>\n#include <string>\n#include <vector>\n#include <algorithm>\nusing namespace std;\n\n';
            
            // Convert class declarations
            cppCode = cppCode.replace(/public\s+class\s+(\w+)\s*\{/g, (match, className) => {
                // Check if this is a main class with main method
                if (cppCode.includes('public static void main')) {
                    return '// Main program\n';
                }
                return `class ${className} {\npublic:`;
            });
            
            // Convert main method
            cppCode = cppCode.replace(/public\s+static\s+void\s+main\s*\(\s*String\[\]\s+\w+\s*\)/g, 'int main()');
            
            // Remove class braces for main programs
            if (cppCode.includes('int main()') && cppCode.includes('// Main program')) {
                // Remove the class wrapper for simple main programs
                cppCode = cppCode.replace(/\/\/ Main program\s*\n/, '');
                // Remove the last closing brace if it's for the class
                const lines = cppCode.split('\n');
                const lastNonEmptyLine = lines.slice().reverse().find(line => line.trim() !== '');
                if (lastNonEmptyLine && lastNonEmptyLine.trim() === '}' && !lastNonEmptyLine.includes('return')) {
                    cppCode = cppCode.replace(/\s*}\s*$/, '');
                }
            }
            
            // Convert method declarations
            cppCode = cppCode.replace(/public\s+static\s+(\w+)/g, 'static $1');
            cppCode = cppCode.replace(/public\s+(\w+)/g, '$1');
            cppCode = cppCode.replace(/private\s+(\w+)/g, '$1');
            cppCode = cppCode.replace(/protected\s+(\w+)/g, '$1');
            
            // Convert data types
            cppCode = cppCode.replace(/\bString\b/g, 'string');
            cppCode = cppCode.replace(/\bboolean\b/g, 'bool');
            cppCode = cppCode.replace(/\bInteger\b/g, 'int');
            cppCode = cppCode.replace(/\bDouble\b/g, 'double');
            cppCode = cppCode.replace(/\bFloat\b/g, 'float');
            cppCode = cppCode.replace(/\bLong\b/g, 'long');
            
            // Convert arrays
            cppCode = cppCode.replace(/(\w+)\[\]\s+(\w+)/g, 'vector<$1> $2');
            cppCode = cppCode.replace(/new\s+(\w+)\[(\w+)\]/g, 'vector<$1>($2)');
            
            // Convert System.out.println and System.out.print
            cppCode = cppCode.replace(/System\.out\.println\s*\(\s*([^)]+)\s*\)\s*;/g, 'cout << $1 << endl;');
            cppCode = cppCode.replace(/System\.out\.print\s*\(\s*([^)]+)\s*\)\s*;/g, 'cout << $1;');
            
            // Handle string concatenation with +
            cppCode = cppCode.replace(/cout\s*<<\s*([^<]+)\s*\+\s*([^<;]+)\s*<<\s*endl;/g, 'cout << $1 << $2 << endl;');
            cppCode = cppCode.replace(/cout\s*<<\s*([^<]+)\s*\+\s*([^<;]+);/g, 'cout << $1 << $2;');
            
            // Fix common issues with quotes in cout
            cppCode = cppCode.replace(/cout\s*<<\s*"([^"]*)\s*\+\s*([^";]+)"/g, 'cout << "$1" << $2');
            cppCode = cppCode.replace(/cout\s*<<\s*([^"]+)\s*\+\s*"([^"]*)"/g, 'cout << $1 << "$2"');
            
            // Convert Scanner input (basic)
            cppCode = cppCode.replace(/Scanner\s+(\w+)\s*=\s*new\s+Scanner\s*\(\s*System\.in\s*\)\s*;/g, '// Scanner $1; // Use cin instead');
            cppCode = cppCode.replace(/(\w+)\.nextInt\(\)/g, 'cin >> temp_int'); // Simple replacement
            cppCode = cppCode.replace(/(\w+)\.nextLine\(\)/g, 'getline(cin, temp_string)');
            
            // Convert variable declarations with initialization
            cppCode = cppCode.replace(/(\w+)\s+(\w+)\s*=\s*new\s+\w+\s*\(\s*\)/g, '$1 $2');
            
            // Fix string literals and concatenation
            cppCode = cppCode.replace(/\+\s*"/g, ' + "');
            cppCode = cppCode.replace(/"\s*\+/g, '" +');
            
            // Convert for loops (enhanced for loop)
            cppCode = cppCode.replace(/for\s*\(\s*(\w+)\s+(\w+)\s*:\s*(\w+)\s*\)/g, 'for($1 $2 : $3)');
            
            // Add return 0 to main if not present
            if (cppCode.includes('int main()')) {
                const mainStart = cppCode.indexOf('int main()');
                const openBrace = cppCode.indexOf('{', mainStart);
                const closeBrace = this.findMatchingBrace(cppCode, openBrace);
                
                if (closeBrace !== -1) {
                    const mainContent = cppCode.substring(openBrace + 1, closeBrace);
                    if (!mainContent.includes('return')) {
                        cppCode = cppCode.substring(0, closeBrace) + 
                                 '\n    return 0;\n' + 
                                 cppCode.substring(closeBrace);
                    }
                }
            }
            
            // Clean up extra whitespace and formatting
            cppCode = cppCode.replace(/\n\s*\n\s*\n/g, '\n\n');
            cppCode = cppCode.replace(/;\s*\n\s*\n/g, ';\n');
            
            return includes + cppCode;
            
        } catch (error) {
            throw new Error(`Conversion failed: ${error.message}`);
        }
    }
    
    findMatchingBrace(code, startPos) {
        let braceCount = 1;
        let pos = startPos + 1;
        
        while (pos < code.length && braceCount > 0) {
            if (code[pos] === '{') {
                braceCount++;
            } else if (code[pos] === '}') {
                braceCount--;
            }
            pos++;
        }
        
        return braceCount === 0 ? pos - 1 : -1;
    }
}

module.exports = JavaToCppConverter;
