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
            
            // Remove package declarations
            cppCode = cppCode.replace(/package\s+[\w.]+;\s*/g, '');
            
            // Add includes
            let includes = '#include <iostream>\n#include <string>\n#include <vector>\nusing namespace std;\n\n';
            
            // Convert class declarations
            cppCode = cppCode.replace(/public\s+class\s+(\w+)\s*{/, 'class $1 {\npublic:');
            
            // Convert main method
            cppCode = cppCode.replace(/public\s+static\s+void\s+main\s*\(\s*String\[\]\s+\w+\s*\)/, 'int main()');
            
            // Convert method declarations
            cppCode = cppCode.replace(/public\s+static\s+(\w+)/g, 'static $1');
            cppCode = cppCode.replace(/public\s+(\w+)/g, '$1');
            cppCode = cppCode.replace(/private\s+(\w+)/g, '$1');
            
            // Convert data types
            cppCode = cppCode.replace(/\bString\b/g, 'string');
            cppCode = cppCode.replace(/\bboolean\b/g, 'bool');
            cppCode = cppCode.replace(/\bInteger\b/g, 'int');
            
            // Convert arrays
            cppCode = cppCode.replace(/(\w+)\[\]/g, 'vector<$1>');
            cppCode = cppCode.replace(/new\s+(\w+)\[(\w+)\]/g, 'vector<$1>($2)');
            
            // Convert System.out.println
            cppCode = cppCode.replace(/System\.out\.println\s*\(\s*/g, 'cout << ');
            cppCode = cppCode.replace(/System\.out\.print\s*\(\s*/g, 'cout << ');
            
            // Fix println endings
            cppCode = cppCode.replace(/cout\s*<<\s*([^;]+);/g, (match, content) => {
                return `cout << ${content} << endl;`;
            });
            
            // Convert variable declarations
            cppCode = cppCode.replace(/(\w+)\s+(\w+)\s*=\s*new\s+\w+\s*\(\s*\)/g, '$1 $2');
            
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
            
            // Clean up extra whitespace
            cppCode = cppCode.replace(/\n\s*\n\s*\n/g, '\n\n');
            
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
