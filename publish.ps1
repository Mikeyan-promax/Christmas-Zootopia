$ErrorActionPreference = 'Stop'

# 1) 生成索引
Write-Host "Building photos-index.json..." -ForegroundColor Cyan
powershell -NoProfile -ExecutionPolicy Bypass -File .\build-photos-index.ps1

# 2) 初始化 Git 仓库（若未初始化）
if (-not (Test-Path ".git")) {
  Write-Host "Initializing git repo..." -ForegroundColor Cyan
  git init
}

# 3) 配置用户信息（避免泄露密码，使用凭据管理器或已登录账号）
git config user.name "Mikeyan-promax"
git config user.email "yanziling@stu.ouc.edu.cn"

# 4) 添加并提交
git add .
git commit -m "deploy: auto index + Christmas gallery"

# 5) 设置远程并推送 main
git branch -M main
git remote remove origin 2>$null
git remote add origin "https://github.com/Mikeyan-promax/Christmas-Zootopia.git"
Write-Host "Pushing to origin/main..." -ForegroundColor Cyan
git push -u origin main

Write-Host "Done. Now enable GitHub Pages: Settings -> Pages -> Deploy from a branch -> main / root" -ForegroundColor Green

# 6) 启动本地预览（可选）
Write-Host "Starting local preview on http://localhost:8000/ ..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoProfile","-ExecutionPolicy","Bypass","-Command","python -m http.server 8000" | Out-Null
