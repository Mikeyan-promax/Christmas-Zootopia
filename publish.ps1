$ErrorActionPreference = 'Stop'

Write-Host '[INFO] Generating photos-index.json' -ForegroundColor Cyan
powershell -NoProfile -ExecutionPolicy Bypass -File .\build-photos-index.ps1 | Out-Null

Write-Host '[INFO] Initialize git repo' -ForegroundColor Cyan
git init | Out-Null

Write-Host '[INFO] Configure git user' -ForegroundColor Cyan
git config user.name 'Mikeyan-promax'
git config user.email 'yanziling@stu.ouc.edu.cn'

Write-Host '[INFO] Stage files' -ForegroundColor Cyan
git add -A

Write-Host '[INFO] Commit' -ForegroundColor Cyan
git commit -m 'Auto publish site' 2>$null

Write-Host '[INFO] Set main branch and remote' -ForegroundColor Cyan
git branch -M main
git remote remove origin 2>$null
git remote add origin 'https://github.com/Mikeyan-promax/Christmas-Zootopia.git'

Write-Host '[INFO] Push to origin/main' -ForegroundColor Cyan
git push -u origin main

Write-Host '[OK] Push done. GitHub Actions workflow will deploy Pages.' -ForegroundColor Green

Write-Host '[INFO] Local preview http://localhost:8000/' -ForegroundColor Cyan
Start-Process powershell -ArgumentList '-NoProfile','-ExecutionPolicy','Bypass','-Command','python -m http.server 8000' | Out-Null
