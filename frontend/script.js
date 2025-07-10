class JavaToCppConverter {
    constructor() {
        this.initializeElements();
        this.bindEvents();
        this.loadExampleCode();
        this.initializeStats();
        this.initializeSyntaxHighlighting();
    }    initializeElements() {
        this.javaInput = document.getElementById('java-input');
        this.cppOutput = document.getElementById('cpp-output');
        this.convertBtn = document.getElementById('convert-btn');
        this.clearInputBtn = document.getElementById('clear-input');
        this.loadExampleBtn = document.getElementById('load-example');        this.copyOutputBtn = document.getElementById('copy-output');
        this.downloadOutputBtn = document.getElementById('download-output');
        this.exportReportBtn = document.getElementById('export-report');
        this.errorMessage = document.getElementById('error-message');
        this.successMessage = document.getElementById('success-message');
        
        // Execution elements
        this.runJavaBtn = document.getElementById('run-java');
        this.runCppBtn = document.getElementById('run-cpp');
        this.clearJavaOutputBtn = document.getElementById('clear-java-output');
        this.clearCppOutputBtn = document.getElementById('clear-cpp-output');        this.javaOutputDiv = document.getElementById('java-output');
        this.cppExecutionOutputDiv = document.getElementById('cpp-execution-output');
        
        // Stats elements
        this.resetStatsBtn = document.getElementById('reset-stats');
    }    bindEvents() {
        this.convertBtn.addEventListener('click', () => this.convertCode());
        this.clearInputBtn.addEventListener('click', () => this.clearInput());
        this.loadExampleBtn.addEventListener('click', () => this.loadExample());        this.copyOutputBtn.addEventListener('click', () => this.copyOutput());
        this.downloadOutputBtn.addEventListener('click', () => this.downloadOutput());
        this.exportReportBtn.addEventListener('click', () => this.exportConversionReport());
        
        // Execution event listeners
        this.runJavaBtn.addEventListener('click', () => this.runJavaCode());
        this.runCppBtn.addEventListener('click', () => this.runCppCode());
        this.clearJavaOutputBtn.addEventListener('click', () => this.clearJavaOutput());
        this.clearCppOutputBtn.addEventListener('click', () => this.clearCppOutput());
        
        // Stats event listeners
        this.resetStatsBtn.addEventListener('click', () => this.resetStats());
          // Auto-resize textareas
        this.javaInput.addEventListener('input', () => {
            this.autoResize(this.javaInput);
            this.validateAndHighlightCode();
        });
        this.cppOutput.addEventListener('input', () => this.autoResize(this.cppOutput));
    }

    autoResize(textarea) {
        textarea.style.height = 'auto';
        textarea.style.height = Math.min(textarea.scrollHeight, 600) + 'px';
    }

    loadExampleCode() {
        const exampleCode = `public class SimpleCalculator {
    public static int add(int a, int b) {
        System.out.println("Adding " + a + " and " + b);
        return a + b;
    }
    
    public static void main(String[] args) {
        int x = 15;
        int y = 3;
        int sum = add(x, y);
        System.out.println("Sum: " + sum);
        
        for (int i = 1; i <= 5; i++) {
            int square = i * i;
            System.out.println("Square of " + i + " is " + square);
        }
        
        int choice = 2;
        switch (choice) {
            case 1:
                System.out.println("Option 1");
                break;
            case 2:
                System.out.println("Option 2");
                int temp = choice * 10;
                System.out.println("Temp: " + temp);
                break;
            default:
                System.out.println("Other option");
        }
    }
}`;
        this.javaInput.value = exampleCode;
    }

    clearInput() {
        this.javaInput.value = '';
        this.cppOutput.value = '';
        this.hideMessages();
        this.clearJavaOutput();
        this.clearCppOutput();
    }

    loadExample() {
        this.loadExampleCode();
        this.hideMessages();
        this.clearJavaOutput();
        this.clearCppOutput();
    }

    async convertCode() {
        const javaCode = this.javaInput.value.trim();
        
        if (!javaCode) {
            this.showError('Please enter some Java code to convert.');
            return;
        }

        this.setLoading(true);
        this.hideMessages();

        try {
            // Simulate the conversion process
            // In a real implementation, this would call your java2cpp.exe
            const cppCode = await this.simulateConversion(javaCode);
            this.cppOutput.value = cppCode;
            this.showSuccess('Code converted successfully!');
            this.incrementStat('conversions');
        } catch (error) {
            this.showError('Conversion failed: ' + error.message);
            console.error('Conversion error:', error);
        } finally {
            this.setLoading(false);
        }
    }    async simulateConversion(javaCode) {
        // Real implementation calling the backend
        try {
            const response = await fetch('/api/convert', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ javaCode }),
            });

            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(errorData.error || 'Conversion failed');
            }

            const result = await response.json();
            return result.cppCode;
        } catch (error) {
            if (error.name === 'TypeError' && error.message.includes('fetch')) {
                throw new Error('Unable to connect to conversion service. Please check if the backend is running.');
            }
            throw error;
        }
    }

    basicJavaToCppConversion(javaCode) {
        // This is a simplified simulation of your converter's output
        // Replace this with actual API calls to your backend
        
        let cppCode = javaCode;
        
        // Basic transformations to simulate your converter
        cppCode = '#include <iostream>\\nusing namespace std;\\n\\n' + 
                 cppCode
                 .replace(/public class \w+\s*{/, '')
                 .replace(/public static void main\(String\[\] args\)/, 'int main()')
                 .replace(/public static (\w+)/g, '$1')
                 .replace(/System\.out\.println\(/g, 'cout << ')
                 .replace(/\);/g, ' << endl;')
                 .replace(/String/g, 'string')
                 .replace(/\s*}\s*$/, '\\n    return 0;\\n}');

        return cppCode;
    }

    async copyOutput() {
        const cppCode = this.cppOutput.value;
        
        if (!cppCode) {
            this.showError('No C++ code to copy.');
            return;
        }

        try {
            await navigator.clipboard.writeText(cppCode);
            this.showSuccess('C++ code copied to clipboard!');
        } catch (error) {
            // Fallback for older browsers
            this.cppOutput.select();
            document.execCommand('copy');
            this.showSuccess('C++ code copied to clipboard!');
        }
    }

    downloadOutput() {
        const cppCode = this.cppOutput.value;
        
        if (!cppCode) {
            this.showError('No C++ code to download.');
            return;
        }

        const blob = new Blob([cppCode], { type: 'text/plain' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'converted_code.cpp';
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
        
        this.showSuccess('C++ code downloaded successfully!');
    }

    setLoading(isLoading) {
        if (isLoading) {
            this.convertBtn.classList.add('loading');
            this.convertBtn.disabled = true;
            this.convertBtn.querySelector('.btn-text').textContent = 'Converting...';
        } else {
            this.convertBtn.classList.remove('loading');
            this.convertBtn.disabled = false;
            this.convertBtn.querySelector('.btn-text').textContent = 'Convert to C++';
        }
    }

    showError(message) {
        this.hideMessages();
        this.errorMessage.textContent = message;
        this.errorMessage.classList.remove('hidden');
        setTimeout(() => this.hideMessages(), 5000);
    }

    showSuccess(message) {
        this.hideMessages();
        this.successMessage.textContent = message;
        this.successMessage.classList.remove('hidden');
        setTimeout(() => this.hideMessages(), 3000);
    }

    hideMessages() {
        this.errorMessage.classList.add('hidden');
        this.successMessage.classList.add('hidden');
    }

    async runJavaCode() {
        const javaCode = this.javaInput.value.trim();
        
        if (!javaCode) {
            this.showExecutionOutput('java', 'No Java code to execute.', 'error');
            return;
        }

        this.setExecutionLoading('java', true);
        this.showExecutionOutput('java', 'Compiling and running Java code...', 'info');

        try {
            const output = await this.executeCode('java', javaCode);
            this.showExecutionOutput('java', output, 'success');
            this.incrementStat('javaExecutions');
        } catch (error) {
            this.showExecutionOutput('java', 'Execution failed: ' + error.message, 'error');
        } finally {
            this.setExecutionLoading('java', false);
        }
    }

    async runCppCode() {
        const cppCode = this.cppOutput.value.trim();
        
        if (!cppCode) {
            this.showExecutionOutput('cpp', 'No C++ code to execute. Convert Java code first.', 'error');
            return;
        }

        this.setExecutionLoading('cpp', true);
        this.showExecutionOutput('cpp', 'Compiling and running C++ code...', 'info');

        try {
            const output = await this.executeCode('cpp', cppCode);
            this.showExecutionOutput('cpp', output, 'success');
            this.incrementStat('cppExecutions');
        } catch (error) {
            this.showExecutionOutput('cpp', 'Execution failed: ' + error.message, 'error');
        } finally {
            this.setExecutionLoading('cpp', false);
        }
    }

    async executeCode(language, code) {
        try {
            const response = await fetch('/api/execute', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ language, code }),
            });

            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(errorData.error || 'Execution failed');
            }

            const result = await response.json();
            
            // Format the output with execution details
            let output = result.output || 'Program executed successfully (no output)';
            
            if (result.executionTime || result.memoryUsed) {
                output += '\n\n--- Execution Details ---';
                if (result.executionTime) output += `\nExecution Time: ${result.executionTime}`;
                if (result.memoryUsed) output += `\nMemory Used: ${result.memoryUsed}`;
                if (result.status) output += `\nStatus: ${result.status}`;
            }
            
            return output;
        } catch (error) {
            if (error.name === 'TypeError' && error.message.includes('fetch')) {
                throw new Error('Unable to connect to execution service. Please check your internet connection.');
            }
            throw error;
        }
    }    showExecutionOutput(language, message, type = 'info') {
        const outputDiv = language === 'java' ? this.javaOutputDiv : this.cppExecutionOutputDiv;
        outputDiv.textContent = message;
        outputDiv.className = `console-content ${type}`;
        
        // Auto-scroll to bottom
        const console = outputDiv.parentElement;
        console.scrollTop = console.scrollHeight;
    }

    clearJavaOutput() {
        this.javaOutputDiv.textContent = 'Click "Run Java" to execute the Java code';
        this.javaOutputDiv.className = 'console-content';
    }    clearCppOutput() {
        this.cppExecutionOutputDiv.textContent = 'Click "Run C++" to execute the C++ code';
        this.cppExecutionOutputDiv.className = 'console-content';
    }

    setExecutionLoading(language, isLoading) {
        const button = language === 'java' ? this.runJavaBtn : this.runCppBtn;
        
        if (isLoading) {
            button.classList.add('executing');
            button.disabled = true;
            button.textContent = language === 'java' ? 'Running...' : 'Compiling...';
        } else {
            button.classList.remove('executing');
            button.disabled = false;
            button.textContent = language === 'java' ? 'Run Java' : 'Run C++';
        }
    }

    initializeStats() {
        this.stats = {
            conversions: parseInt(localStorage.getItem('conversions') || '0'),
            javaExecutions: parseInt(localStorage.getItem('javaExecutions') || '0'),
            cppExecutions: parseInt(localStorage.getItem('cppExecutions') || '0'),
            failures: parseInt(localStorage.getItem('failures') || '0')
        };
        this.updateStatsDisplay();
    }

    initializeSyntaxHighlighting() {
        // Initialize Prism.js when it's available
        if (typeof Prism !== 'undefined') {
            Prism.highlightAll();
        }
    }

    applySyntaxHighlighting() {
        // Apply syntax highlighting when Prism.js is available
        if (typeof Prism !== 'undefined') {
            setTimeout(() => {
                Prism.highlightAll();
            }, 100);
        }
    }

    // Enhanced code validation with more detailed feedback
    validateAndHighlightCode() {
        const javaCode = this.javaInput.value.trim();
        
        if (!javaCode) return;
        
        try {
            validateJavaCode(javaCode);
            this.javaInput.style.borderColor = '#28a745';
        } catch (error) {
            this.javaInput.style.borderColor = '#dc3545';
            console.warn('Code validation warning:', error.message);
        }
        
        // Reset border color after 2 seconds
        setTimeout(() => {
            this.javaInput.style.borderColor = '';
        }, 2000);
    }

    // Add code formatting helper
    formatCode(code, language) {
        if (!code) return '';
        
        // Basic formatting improvements
        let formatted = code
            .replace(/\s*{\s*/g, ' {\n    ')
            .replace(/;\s*/g, ';\n    ')
            .replace(/}\s*/g, '\n}\n');
            
        return formatted;
    }

    // Add export functionality
    exportConversionReport() {
        const javaCode = this.javaInput.value.trim();
        const cppCode = this.cppOutput.value.trim();
        
        if (!javaCode || !cppCode) {
            this.showError('Both Java and C++ code must be present to export.');
            return;
        }
        
        const report = `# Java to C++ Conversion Report
Generated on: ${new Date().toLocaleString()}

## Original Java Code:
\`\`\`java
${javaCode}
\`\`\`

## Converted C++ Code:
\`\`\`cpp
${cppCode}
\`\`\`

## Statistics:
- Total Conversions: ${this.stats.conversions}
- Java Executions: ${this.stats.javaExecutions}
- C++ Executions: ${this.stats.cppExecutions}

---
Generated by Java to C++ Converter
`;
        
        const blob = new Blob([report], { type: 'text/markdown' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'conversion_report.md';
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
        
        this.showSuccess('Conversion report exported successfully!');
    }

    updateStatsDisplay() {
        document.getElementById('conversion-count').textContent = this.stats.conversions;
        document.getElementById('java-executions').textContent = this.stats.javaExecutions;
        document.getElementById('cpp-executions').textContent = this.stats.cppExecutions;
        
        const total = this.stats.conversions + this.stats.javaExecutions + this.stats.cppExecutions;
        const successRate = total > 0 ? Math.round(((total - this.stats.failures) / total) * 100) : 100;
        document.getElementById('success-rate').textContent = successRate + '%';
    }    incrementStat(statName) {
        this.stats[statName]++;
        localStorage.setItem(statName, this.stats[statName].toString());
        this.updateStatsDisplay();
        this.animateStatCounter(statName);
    }

    resetStats() {
        // Show confirmation dialog
        if (confirm('Are you sure you want to reset all statistics? This action cannot be undone.')) {
            this.stats = {
                conversions: 0,
                javaExecutions: 0,
                cppExecutions: 0,
                failures: 0
            };
            
            // Clear localStorage
            localStorage.removeItem('conversions');
            localStorage.removeItem('javaExecutions');
            localStorage.removeItem('cppExecutions');
            localStorage.removeItem('failures');
            
            // Update display with animation
            this.updateStatsDisplay();
            this.animateStatsReset();
            
            this.showSuccess('Statistics have been reset successfully!');
        }
    }

    animateStatsReset() {
        const statElements = [
            'conversion-count',
            'java-executions', 
            'cpp-executions',
            'success-rate'
        ];
        
        statElements.forEach((elementId, index) => {
            const element = document.getElementById(elementId);
            if (element) {
                setTimeout(() => {
                    element.style.transform = 'scale(0.8)';
                    element.style.color = '#ef4444';
                    setTimeout(() => {
                        element.style.transform = 'scale(1)';
                        element.style.color = '';
                    }, 200);
                }, index * 100);
            }
        });
    }

    animateStatCounter(statName) {
        const elementMap = {
            conversions: 'conversion-count',
            javaExecutions: 'java-executions',
            cppExecutions: 'cpp-executions'
        };
        
        const element = document.getElementById(elementMap[statName]);
        if (element) {
            element.style.transform = 'scale(1.2)';
            element.style.color = '#667eea';
            setTimeout(() => {
                element.style.transform = 'scale(1)';
                element.style.color = '';
            }, 300);
        }
    }
}

// Backend integration example (for when you implement the real backend)
class BackendService {
    constructor(baseUrl = 'http://localhost:3000') {
        this.baseUrl = baseUrl;
    }

    async convertJavaToCpp(javaCode) {
        try {
            const response = await fetch(`${this.baseUrl}/convert`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ javaCode }),
            });

            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(errorData.error || 'Conversion failed');
            }

            const result = await response.json();
            return result.cppCode;
        } catch (error) {
            if (error.name === 'TypeError' && error.message.includes('fetch')) {
                throw new Error('Unable to connect to conversion service. Please check if the backend is running.');
            }
            throw error;
        }
    }
}

// Initialize the converter when the page loads
document.addEventListener('DOMContentLoaded', () => {
    new JavaToCppConverter();
});

// Additional utility functions
function validateJavaCode(code) {
    // Basic validation for Java code structure
    const hasClass = /class\s+\w+/.test(code);
    const hasMain = /public\s+static\s+void\s+main/.test(code);
    
    if (!hasClass && !hasMain) {
        throw new Error('Java code should contain either a class declaration or a main method.');
    }
    
    // Check for unsupported features
    const unsupportedFeatures = [
        { pattern: /\.length/, message: 'Array.length property is not supported. Use fixed array sizes instead.' },
        { pattern: /boolean\s+\w+/, message: 'Boolean type is not supported. Use int instead.' },
        { pattern: /\[\]\s*\[\]/, message: '2D arrays are not supported. Use 1D arrays instead.' },
        { pattern: /\w+\s*\[\s*\]\s*\[\s*\]/, message: '2D arrays are not supported. Use 1D arrays instead.' },
        { pattern: /-\d+/, message: 'Negative number literals may not be supported in all contexts.' }
    ];
    
    for (const feature of unsupportedFeatures) {
        if (feature.pattern.test(code)) {
            console.warn('Potentially unsupported feature:', feature.message);
        }
    }
    
    return true;
}
