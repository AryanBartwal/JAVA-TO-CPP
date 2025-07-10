/**
 * Judge0 API Service for code execution
 * Provides secure, sandboxed code execution for Java and C++
 */

class Judge0Service {
    constructor() {
        // Using the free Judge0 CE API
        this.baseURL = 'https://judge0-ce.p.rapidapi.com';
        this.apiKey = process.env.JUDGE0_API_KEY || 'demo-key'; // Will use demo for now
        
        // Language IDs for Judge0
        this.languageIds = {
            'java': 62,     // Java (OpenJDK 13.0.1)
            'cpp': 54,      // C++ (GCC 9.2.0)
            'c': 50         // C (GCC 9.2.0)
        };
    }

    async executeCode(language, sourceCode, input = '') {
        try {
            // Get language ID
            const languageId = this.languageIds[language.toLowerCase()];
            if (!languageId) {
                throw new Error(`Unsupported language: ${language}`);
            }

            // Submit code for execution
            const submissionResponse = await this.submitCode(languageId, sourceCode, input);
            
            // Wait for execution to complete and get result
            const result = await this.getResult(submissionResponse.token);
            
            return this.formatResult(result);

        } catch (error) {
            throw new Error(`Execution failed: ${error.message}`);
        }
    }

    async submitCode(languageId, sourceCode, input) {
        const response = await fetch(`${this.baseURL}/submissions?wait=true`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-RapidAPI-Key': this.apiKey,
                'X-RapidAPI-Host': 'judge0-ce.p.rapidapi.com'
            },
            body: JSON.stringify({
                language_id: languageId,
                source_code: sourceCode,
                stdin: input || '',
                cpu_time_limit: 5,      // 5 seconds max
                memory_limit: 128000,   // 128MB max
                wall_time_limit: 10     // 10 seconds max wall time
            })
        });

        if (!response.ok) {
            const errorData = await response.text();
            throw new Error(`Judge0 API error: ${response.status} - ${errorData}`);
        }

        return await response.json();
    }

    async getResult(token) {
        const response = await fetch(`${this.baseURL}/submissions/${token}`, {
            method: 'GET',
            headers: {
                'X-RapidAPI-Key': this.apiKey,
                'X-RapidAPI-Host': 'judge0-ce.p.rapidapi.com'
            }
        });

        if (!response.ok) {
            throw new Error(`Failed to get result: ${response.status}`);
        }

        return await response.json();
    }

    formatResult(result) {
        const { status, stdout, stderr, compile_output, time, memory } = result;
        
        let output = '';
        let isError = false;

        // Check execution status
        if (status.id === 3) { // Accepted
            output = stdout || 'Program executed successfully (no output)';
        } else if (status.id === 6) { // Compilation Error
            output = `Compilation Error:\n${compile_output || stderr || 'Unknown compilation error'}`;
            isError = true;
        } else if (status.id === 5) { // Time Limit Exceeded
            output = 'Time Limit Exceeded - Program took too long to execute';
            isError = true;
        } else if (status.id === 4) { // Wrong Answer (Runtime Error)
            output = `Runtime Error:\n${stderr || 'Unknown runtime error'}`;
            isError = true;
        } else if (status.id === 7) { // Runtime Error
            output = `Runtime Error:\n${stderr || 'Program crashed during execution'}`;
            isError = true;
        } else if (status.id === 8) { // Internal Error
            output = 'Internal Error - Please try again later';
            isError = true;
        } else if (status.id === 9) { // Exec Format Error
            output = 'Execution Format Error - Invalid executable';
            isError = true;
        } else {
            output = stderr || stdout || `Unknown status: ${status.description}`;
            isError = !!stderr;
        }

        return {
            output: output.trim(),
            isError,
            executionTime: time ? `${time}s` : null,
            memoryUsed: memory ? `${memory}KB` : null,
            status: status.description
        };
    }

    // Fallback execution for when Judge0 is not available
    simulateExecution(language, code) {
        try {
            if (language === 'java') {
                return this.simulateJavaExecution(code);
            } else if (language === 'cpp') {
                return this.simulateCppExecution(code);
            }
            
            return {
                output: 'Simulation not available for this language',
                isError: false,
                executionTime: null,
                memoryUsed: null,
                status: 'Simulated'
            };
        } catch (error) {
            return {
                output: `Simulation error: ${error.message}`,
                isError: true,
                executionTime: null,
                memoryUsed: null,
                status: 'Simulation Failed'
            };
        }
    }

    simulateJavaExecution(code) {
        // Simple simulation for basic Java programs
        const printMatches = code.match(/System\.out\.println\s*\(\s*"([^"]+)"\s*\)/g);
        let output = '';
        
        if (printMatches) {
            printMatches.forEach(match => {
                const textMatch = match.match(/"([^"]+)"/);
                if (textMatch) {
                    output += textMatch[1] + '\n';
                }
            });
        }
        
        if (!output) {
            output = 'Program executed (output simulation limited to simple println statements)';
        }
        
        return {
            output: output.trim(),
            isError: false,
            executionTime: '~0.1s',
            memoryUsed: '~64KB',
            status: 'Simulated - Basic Output Only'
        };
    }

    simulateCppExecution(code) {
        // Simple simulation for basic C++ programs
        const coutMatches = code.match(/cout\s*<<\s*"([^"]+)"/g);
        let output = '';
        
        if (coutMatches) {
            coutMatches.forEach(match => {
                const textMatch = match.match(/"([^"]+)"/);
                if (textMatch) {
                    output += textMatch[1] + '\n';
                }
            });
        }
        
        if (!output) {
            output = 'Program executed (output simulation limited to simple cout statements)';
        }
        
        return {
            output: output.trim(),
            isError: false,
            executionTime: '~0.1s',
            memoryUsed: '~32KB',
            status: 'Simulated - Basic Output Only'
        };
    }
}

module.exports = Judge0Service;
