/**
 * JavaScript-based Java to C++ converter fallback
 * Used when the native Flex/Bison converter is not available
 */
class JavaToCppConverter {
    constructor() {
        this.stats = {
            conversions: 0,
            successful: 0,
            failed: 0
        };
    }

    convert(javaCode) {
        try {
            this.stats.conversions++;
            
            let cppCode = javaCode;
            
            // Basic conversions for common Java patterns
            cppCode = this.convertHeaders(cppCode);
            cppCode = this.convertClassStructure(cppCode);
            cppCode = this.convertDataTypes(cppCode);
            cppCode = this.convertPrintStatements(cppCode);
            cppCode = this.convertArrayDeclarations(cppCode);
            cppCode = this.convertStringConcatenation(cppCode);
            
            this.stats.successful++;
            return cppCode;
            
        } catch (error) {
            this.stats.failed++;
            throw new Error(`Conversion failed: ${error.message}`);
        }
    }

    convertHeaders(code) {
        // Add C++ headers and remove Java imports
        let result = code;
        
        // Remove Java imports
        result = result.replace(/import\s+.*?;\s*/g, '');
        
        // Add C++ headers if not present
        if (!result.includes('#include <iostream>')) {
            result = '#include <iostream>\nusing namespace std;\n\n' + result;
        }
        
        return result;
    }

    convertClassStructure(code) {
        let result = code;
        
        // Convert main method
        result = result.replace(
            /public\s+static\s+void\s+main\s*\(\s*String\s*\[\s*\]\s*\w*\s*\)/g,
            'int main()'
        );
        
        // Remove public class declarations but keep the body
        result = result.replace(
            /public\s+class\s+\w+\s*\{/g,
            ''
        );
        
        // Add return 0 to main if not present
        if (result.includes('int main()') && !result.includes('return 0;')) {
            result = result.replace(
                /(int main\(\)\s*\{[\s\S]*?)(\}(?=\s*$))/,
                '$1    return 0;\n$2'
            );
        }
        
        return result;
    }

    convertDataTypes(code) {
        let result = code;
        
        // Convert String to string
        result = result.replace(/\bString\b/g, 'string');
        
        // Convert boolean to bool
        result = result.replace(/\bboolean\b/g, 'bool');
        
        return result;
    }

    convertPrintStatements(code) {
        let result = code;
        
        // Convert System.out.println to cout
        result = result.replace(
            /System\.out\.println\s*\(\s*(.*?)\s*\)\s*;/g,
            (match, content) => {
                // Handle string concatenation
                let converted = content.replace(/\s*\+\s*/g, ' << ');
                return `cout << ${converted} << endl;`;
            }
        );
        
        // Convert System.out.print to cout
        result = result.replace(
            /System\.out\.print\s*\(\s*(.*?)\s*\)\s*;/g,
            (match, content) => {
                let converted = content.replace(/\s*\+\s*/g, ' << ');
                return `cout << ${converted};`;
            }
        );
        
        return result;
    }

    convertArrayDeclarations(code) {
        let result = code;
        
        // Convert int[] arr = new int[size] to int arr[size]
        result = result.replace(
            /(\w+)\s*\[\s*\]\s*(\w+)\s*=\s*new\s+\w+\s*\[\s*(\w+)\s*\]\s*;/g,
            '$1 $2[$3];'
        );
        
        return result;
    }

    convertStringConcatenation(code) {
        let result = code;
        
        // This is handled in print statements, but we can add more general cases
        // For now, keep it simple
        
        return result;
    }

    getStats() {
        return this.stats;
    }

    resetStats() {
        this.stats = {
            conversions: 0,
            successful: 0,
            failed: 0
        };
    }
}

module.exports = JavaToCppConverter;
