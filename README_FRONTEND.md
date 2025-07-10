# Java to C++ Converter - Web Frontend

A modern web interface for converting Java code to C++ using your custom parser and lexer.

## Features

- **Modern Web Interface**: Clean, responsive design with syntax highlighting
- **Real-time Conversion**: Convert Java code to C++ instantly
- **Code Management**: Load examples, clear input, copy output, and download results
- **Error Handling**: Clear error messages and validation
- **Responsive Design**: Works on desktop, tablet, and mobile devices

## Supported Java Features

✅ Static methods with parameters and return values  
✅ Basic data types: `int`, `char`, `float`, `double`  
✅ 1D arrays with fixed sizes  
✅ All loop types: `for`, `while`, `do-while`  
✅ Conditional statements: `if`, `else if`, `else`  
✅ Switch statements with `case` and `default`  
✅ Mathematical operations and comparisons  
✅ Method calls and string concatenation  

## Limitations

❌ 2D arrays (`int[][]`)  
❌ Boolean data type  
❌ Array `.length` property  
❌ Negative number literals in method calls  
❌ Object-oriented features  
❌ Exception handling  

## Installation

1. **Prerequisites**: Make sure you have Node.js installed (version 14 or higher)

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Make sure your `java2cpp.exe` is in the root directory**

## Usage

### Development Mode
```bash
npm run dev
```
This starts the server with auto-restart on file changes.

### Production Mode
```bash
npm start
```

### Access the Web Interface
Open your browser and go to: `http://localhost:3000`

## File Structure

```
java-to-cpp/
├── frontend/
│   ├── index.html          # Main web interface
│   ├── style.css           # Styling and responsive design
│   └── script.js           # Frontend JavaScript logic
├── server.js               # Express.js backend server
├── package.json            # Node.js dependencies
├── java2cpp.exe           # Your Java to C++ converter
├── parser.y               # Yacc/Bison parser grammar
├── lexer.l                # Lex/Flex lexer rules
└── README.md              # This file
```

## API Endpoints

### `POST /convert`
Convert Java code to C++

**Request Body:**
```json
{
  "javaCode": "public class Test { ... }"
}
```

**Response:**
```json
{
  "cppCode": "#include <iostream>\\nusing namespace std;\\n..."
}
```

**Error Response:**
```json
{
  "error": "Syntax error at line 5, near token 'length'"
}
```

### `GET /health`
Health check endpoint

**Response:**
```json
{
  "status": "OK",
  "timestamp": "2024-12-19T10:30:00.000Z"
}
```

## How It Works

1. **Frontend**: User enters Java code in the web interface
2. **Backend**: Express.js server receives the code via REST API
3. **Processing**: Server writes Java code to temporary file
4. **Conversion**: Calls your `java2cpp.exe` with the temporary file
5. **Output**: Returns converted C++ code to the frontend
6. **Display**: Frontend shows the converted C++ code with syntax highlighting

## Browser Support

- Chrome/Edge 60+
- Firefox 55+
- Safari 12+
- Mobile browsers (iOS Safari, Chrome Mobile)

## Development

### Adding New Features

1. **Frontend**: Modify `frontend/script.js` for new UI features
2. **Backend**: Update `server.js` for new API endpoints
3. **Styling**: Edit `frontend/style.css` for visual changes

### Debugging

- Check browser console for frontend errors
- Check terminal/command prompt for backend errors
- Use browser developer tools for network debugging

## Security Notes

- The server creates temporary files in a `temp/` directory
- Files are automatically cleaned up after conversion
- Input validation prevents basic security issues
- Consider adding rate limiting for production use

## Deployment

### Local Network Access
To allow access from other devices on your network:
```bash
# Set the host to 0.0.0.0
node server.js
```
Then access via your computer's IP address: `http://192.168.1.xxx:3000`

### Production Deployment
For production deployment, consider:
- Using a process manager like PM2
- Setting up reverse proxy with Nginx
- Adding HTTPS with SSL certificates
- Implementing rate limiting and security headers

## Troubleshooting

### Common Issues

1. **"java2cpp.exe not found"**
   - Make sure `java2cpp.exe` is in the root directory
   - Check file permissions

2. **"Conversion failed"**
   - Check if your Java code follows supported syntax
   - Review the limitations section above

3. **"Cannot connect to server"**
   - Make sure the server is running on port 3000
   - Check if another application is using the port

4. **Permission errors**
   - Make sure the application has write permissions for the temp directory
   - Check if antivirus is blocking file creation

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

MIT License - feel free to use and modify as needed.
