const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const { exec } = require('child_process');
const cors = require('cors');
const JavaToCppConverter = require('./js-converter');

const app = express();
let PORT = process.env.PORT || 3000;

// Initialize the JavaScript converter as fallback
const jsConverter = new JavaToCppConverter();

// Function to find available port (not needed on Vercel)
const findAvailablePort = (port) => {
    if (process.env.VERCEL) {
        return Promise.resolve(port);
    }
    return new Promise((resolve, reject) => {
        const server = require('net').createServer();
        server.listen(port, (err) => {
            if (err) {
                server.close();
                resolve(findAvailablePort(port + 1));
            } else {
                const actualPort = server.address().port;
                server.close();
                resolve(actualPort);
            }
        });
    });
};

// Middleware
app.use(cors());
app.use(express.json({ limit: '10mb' }));

// Serve static files differently based on environment
if (process.env.VERCEL) {
    // On Vercel, we don't need to serve static files from the server
    // They are handled by the routing configuration
} else {
    // Local development
    app.use(express.static('frontend'));
    app.get('/', (req, res) => {
        res.sendFile(path.join(__dirname, 'frontend', 'index.html'));
    });
}

// Conversion endpoint
app.post('/api/convert', async (req, res) => {
    try {
        const { javaCode } = req.body;
        
        if (!javaCode) {
            return res.status(400).json({ error: 'No Java code provided' });
        }

        // Create temporary files
        const tempDir = process.env.VERCEL ? '/tmp' : path.join(__dirname, 'temp');
        if (!fs.existsSync(tempDir)) {
            fs.mkdirSync(tempDir, { recursive: true });
        }

        const timestamp = Date.now();
        const javaFile = path.join(tempDir, `temp_${timestamp}.java`);

        // Write Java code to temporary file
        fs.writeFileSync(javaFile, javaCode);

        // Execute your java2cpp converter
        const converterPath = process.env.VERCEL ? 
            path.join(__dirname, 'java2cpp') : // Unix executable on Vercel
            path.join(__dirname, 'java2cpp.exe'); // Windows executable locally
        
        // Check if native converter exists
        if (!fs.existsSync(converterPath)) {
            console.log('Native converter not found, using JavaScript fallback');
            try {
                const cppCode = jsConverter.convert(javaCode);
                
                // Clean up temporary file
                if (fs.existsSync(javaFile)) {
                    fs.unlinkSync(javaFile);
                }
                
                return res.json({ cppCode });
            } catch (jsError) {
                // Clean up temporary file
                if (fs.existsSync(javaFile)) {
                    fs.unlinkSync(javaFile);
                }
                return res.status(400).json({ error: `JavaScript converter failed: ${jsError.message}` });
            }
        }
        
        let command;
        if (process.platform === 'win32') {
            command = `type "${javaFile}" | "${converterPath}"`;
        } else {
            command = `cat "${javaFile}" | "${converterPath}"`;
        }

        exec(command, { shell: true, cwd: __dirname }, (error, stdout, stderr) => {
            try {
                // Clean up temporary Java file
                if (fs.existsSync(javaFile)) {
                    fs.unlinkSync(javaFile);
                }

                if (error) {
                    console.error('Conversion error:', error);
                    console.error('Stderr:', stderr);
                    
                    let errorMessage = 'Conversion failed';
                    if (stderr.includes('syntax error')) {
                        errorMessage = 'Syntax error in Java code: ' + stderr;
                    } else if (stderr.includes('Error:')) {
                        errorMessage = stderr;
                    }
                    
                    return res.status(400).json({ error: errorMessage });
                }

                // Get the converted C++ code
                const cppCode = stdout;
                
                if (!cppCode || cppCode.trim() === '') {
                    return res.status(400).json({ error: 'Conversion produced no output' });
                }

                res.json({ cppCode });

            } catch (cleanupError) {
                console.error('Cleanup error:', cleanupError);
                res.status(500).json({ error: 'Internal server error during cleanup' });
            }
        });

    } catch (error) {
        console.error('Server error:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
});

// Code execution endpoint
app.post('/api/execute', async (req, res) => {
    try {
        const { language, code } = req.body;
        
        if (!language || !code) {
            return res.status(400).json({ error: 'Language and code are required' });
        }

        // Check if we're in Vercel environment
        if (process.env.VERCEL) {
            return res.status(400).json({ 
                error: `Code execution is not available in the deployed environment due to security restrictions. This feature works in local development mode only.` 
            });
        }

        // Create temporary files
        const tempDir = process.env.VERCEL ? '/tmp' : path.join(__dirname, 'temp');
        if (!fs.existsSync(tempDir)) {
            fs.mkdirSync(tempDir, { recursive: true });
        }

        const timestamp = Date.now();
        let sourceFile, executableFile, compileCommand, runCommand;

        if (language === 'java') {
            // Extract class name from Java code
            const classMatch = code.match(/public\s+class\s+(\w+)/);
            const className = classMatch ? classMatch[1] : 'Main';
            
            sourceFile = path.join(tempDir, `${className}.java`);
            fs.writeFileSync(sourceFile, code);
            
            compileCommand = `javac "${sourceFile}"`;
            runCommand = `cd "${tempDir}" && java ${className}`;
        } else if (language === 'cpp') {
            sourceFile = path.join(tempDir, `temp_${timestamp}.cpp`);
            executableFile = path.join(tempDir, `temp_${timestamp}.exe`);
            
            fs.writeFileSync(sourceFile, code);
            
            compileCommand = `g++ -std=c++11 -o "${executableFile}" "${sourceFile}"`;
            runCommand = `cd "${tempDir}" && .\\temp_${timestamp}.exe`;
        } else {
            return res.status(400).json({ error: 'Unsupported language' });
        }

        // Compile the code
        exec(compileCommand, { shell: true, cwd: __dirname, timeout: 10000 }, (compileError, compileStdout, compileStderr) => {
            if (compileError) {
                // Clean up files
                cleanupFiles([sourceFile, executableFile]);
                
                let errorMessage = 'Compilation failed';
                if (compileStderr) {
                    errorMessage += ':\\n' + compileStderr;
                }
                
                return res.status(400).json({ error: errorMessage });
            }

            // Run the compiled code
            exec(runCommand, { shell: true, cwd: __dirname, timeout: 5000 }, (runError, runStdout, runStderr) => {
                // Clean up files
                cleanupFiles([sourceFile, executableFile]);
                
                if (runError) {
                    let errorMessage = 'Runtime error';
                    if (runStderr) {
                        errorMessage += ':\\n' + runStderr;
                    }
                    return res.status(400).json({ error: errorMessage });
                }

                const output = runStdout || 'Program executed successfully (no output)';
                res.json({ output });
            });
        });

    } catch (error) {
        console.error('Execution error:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
});

function cleanupFiles(files) {
    files.forEach(file => {
        if (file && fs.existsSync(file)) {
            try {
                fs.unlinkSync(file);
            } catch (error) {
                console.error('Error cleaning up file:', file, error);
            }
        }
    });
}

// Health check endpoint
app.get('/api/health', (req, res) => {
    res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

// Error handling middleware
app.use((error, req, res, next) => {
    console.error('Unhandled error:', error);
    res.status(500).json({ error: 'Internal server error' });
});

// 404 handler
app.use((req, res) => {
    res.status(404).json({ error: 'Endpoint not found' });
});

// Start server with port finding
(async () => {
    try {
        PORT = await findAvailablePort(PORT);
        app.listen(PORT, () => {
            console.log(`Java to C++ Converter Server running on port ${PORT}`);
            console.log(`Frontend available at: http://localhost:${PORT}`);
            console.log(`API endpoint: http://localhost:${PORT}/convert`);
        });
    } catch (error) {
        console.error('Failed to start server:', error);
        process.exit(1);
    }
})();

module.exports = app;
