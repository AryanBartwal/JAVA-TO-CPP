# Deployment Guide for Java to C++ Converter

This guide will help you deploy your Java to C++ converter to Vercel.

## Prerequisites

1. **Vercel Account**: Sign up at [vercel.com](https://vercel.com)
2. **Vercel CLI**: Install globally with `npm install -g vercel`
3. **Git Repository**: Your code should be in a Git repository

## Deployment Steps

### Method 1: Using Vercel CLI (Recommended)

1. **Install Vercel CLI** (if not already installed):
   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel**:
   ```bash
   vercel login
   ```

3. **Navigate to your project directory**:
   ```bash
   cd path/to/your/java-to-cpp-converter
   ```

4. **Deploy to Vercel**:
   ```bash
   vercel
   ```

5. **Follow the prompts**:
   - Set up and deploy? `Y`
   - Which scope? Choose your account
   - Link to existing project? `N` (for first deployment)
   - What's your project's name? `java-to-cpp-converter`
   - In which directory is your code located? `./`

6. **Deploy to production**:
   ```bash
   vercel --prod
   ```

### Method 2: Using Vercel Dashboard

1. **Push your code to GitHub**:
   ```bash
   git add .
   git commit -m "Prepare for Vercel deployment"
   git push origin main
   ```

2. **Go to Vercel Dashboard**:
   - Visit [vercel.com/dashboard](https://vercel.com/dashboard)
   - Click "New Project"
   - Import your GitHub repository

3. **Configure deployment**:
   - Framework Preset: `Other`
   - Root Directory: `./`
   - Build Command: `npm run build`
   - Output Directory: Leave empty
   - Install Command: `npm install`

4. **Environment Variables** (if needed):
   - Add any environment variables your app needs

5. **Deploy**:
   - Click "Deploy"

## Project Configuration

The project includes the following configuration files for Vercel:

- **`vercel.json`**: Vercel deployment configuration
- **`package.json`**: Node.js dependencies and scripts
- **`.gitignore`**: Files to exclude from deployment

## Features

- ✅ Serverless Node.js backend
- ✅ Static frontend hosting
- ✅ JavaScript fallback converter (when native executable isn't available)
- ✅ API endpoints for conversion and code execution
- ✅ CORS enabled for cross-origin requests

## API Endpoints

Once deployed, your app will have these endpoints:

- `GET /` - Frontend application
- `POST /api/convert` - Convert Java code to C++
- `POST /api/execute` - Execute Java or C++ code
- `GET /api/health` - Health check

## Environment Considerations

- **Local Development**: Uses native `java2cpp.exe` when available
- **Vercel Production**: Uses JavaScript-based converter as fallback
- **Temporary Files**: Uses `/tmp` directory on Vercel for temporary file storage

## Troubleshooting

### Common Issues

1. **Build Fails**:
   - Check `package.json` dependencies
   - Ensure all required files are included

2. **API Endpoints Not Working**:
   - Verify API routes start with `/api/`
   - Check `vercel.json` configuration

3. **Frontend Not Loading**:
   - Ensure frontend files are in `/frontend` directory
   - Check static file routing in `vercel.json`

### Debug Steps

1. **Check deployment logs**:
   ```bash
   vercel logs
   ```

2. **Test API endpoints**:
   ```bash
   curl https://your-app.vercel.app/api/health
   ```

3. **Monitor function execution**:
   - Check Vercel dashboard for function logs

## Custom Domain (Optional)

To add a custom domain:

1. Go to your project in Vercel dashboard
2. Navigate to "Settings" → "Domains"
3. Add your domain and configure DNS

## Updates

To update your deployment:

```bash
git add .
git commit -m "Your update message"
git push origin main
```

Vercel will automatically redeploy when you push to the main branch.

## Support

If you encounter issues:

1. Check Vercel documentation: [vercel.com/docs](https://vercel.com/docs)
2. Check function logs in Vercel dashboard
3. Test locally first: `npm start`
