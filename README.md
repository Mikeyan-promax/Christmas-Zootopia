# Christmas Zootopia

[![Deploy Pages](https://github.com/Mikeyan-promax/Christmas-Zootopia/actions/workflows/deploy-pages.yml/badge.svg)](https://github.com/Mikeyan-promax/Christmas-Zootopia/actions/workflows/deploy-pages.yml)

- 访问地址：发布完成后将显示在仓库 Settings → Pages 或 Actions 任务输出。
- 本地预览：`python -m http.server 8000` 然后打开 `http://localhost:8000/index.html`。

## 功能
- 自动读取同目录 `photos-index.json` 并加载图片
- 手势识别：握拳合树、张手散开、移动旋转、捏合高亮并放大目标照片

## 索引生成
`powershell -NoProfile -ExecutionPolicy Bypass -File .\build-photos-index.ps1`

## 一键发布
`powershell -NoProfile -ExecutionPolicy Bypass -File .\publish.ps1`
