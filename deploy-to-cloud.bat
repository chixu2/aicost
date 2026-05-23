@echo off
chcp 65001 >nul
echo ==========================================
echo  智价AI - 云端部署助手
echo ==========================================
echo.

REM 检查 git
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Git，请先安装 Git
    echo 下载地址: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [1/4] 正在初始化 Git 仓库...
cd /d "%~dp0"
git init
git add .
git commit -m "Initial commit for cloud deployment"

echo.
echo [2/4] Git 仓库准备完成！
echo.
echo ==========================================
echo  下一步操作：
echo ==========================================
echo.
echo 1. 在浏览器中访问 https://github.com/new
echo 2. 创建一个新仓库（名称：aicost）
echo 3. 不要勾选 "Initialize this repository with a README"
echo 4. 创建完成后，复制仓库地址（HTTPS）
echo    例如：https://github.com/你的用户名/aicost.git
echo.
echo 5. 回到此窗口，粘贴仓库地址：
set /p REPO_URL="仓库地址: "

echo.
echo [3/4] 正在上传代码到 GitHub...
git remote add origin %REPO_URL%
git branch -M main
git push -u origin main

echo.
echo [4/4] 上传完成！
echo.
echo ==========================================
echo  接下来请按以下步骤部署：
echo ==========================================
echo.
echo 【步骤1】部署后端（Render）
echo 1. 访问 https://dashboard.render.com/blueprint
echo 2. 点击 "Connect a repository"
echo 3. 选择你的 GitHub 账号和 aicost 仓库
echo 4. Render 会自动识别 render.yaml 配置
echo 5. 点击 "Apply" 开始部署
echo 6. 等待部署完成（约5-10分钟）
echo 7. 记录后端地址：https://aicost-backend-xxxxx.onrender.com
echo.
echo 【步骤2】部署前端（Vercel）
echo 1. 访问 https://vercel.com/new
echo 2. 导入你的 GitHub 仓库（aicost）
echo 3. 配置项目：
echo    - Framework Preset: Vite
echo    - Root Directory: frontend
echo    - Build Command: npm run build
echo    - Output Directory: dist
echo 4. 点击 Environment Variables，添加：
echo    - Name: VITE_API_BASE
echo    - Value: https://你的后端地址.onrender.com/api
echo 5. 点击 Deploy
echo.
echo ==========================================
echo  部署完成后，你会得到一个网址：
echo  https://aicost-xxxxx.vercel.app/aicost/
echo ==========================================
echo.
pause
