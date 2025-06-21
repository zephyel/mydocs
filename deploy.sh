#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e


# 生成静态文件
echo "📦 开始构建 VuePress 静态文件..."
pnpm docs:build
echo "✅ 构建完成！"


# 在 my-docs里开发和提交源码(main分支)
# git add .
# git commit -m "my-docs $(date '+%Y-%m-%d %H:%M:%S')"
# git push https://github.com/zephyel/zephyel.github.io.git main
# git push git@github.com:zephyel/zephyel.github.io.git main


# 进入生成的文件夹，初始化 Git 仓库并提交（注意这里改成了 VuePress 的默认输出目录）
echo "📂 进入输出目录 dist/, 初始化 Git 仓库并提交更改..."
cd src/.vuepress/dist
git init
git add -A
git commit -m "deploy $(date '+%Y-%m-%d %H:%M:%S')"


# 部署到 GitHub Pages
echo "🚀 推送到 GitHub Pages..."
# 如果你想要部署到 https://USERNAME.github.io
git push -f https://github.com/zephyel/zephyel.github.io.git master
# git push -f git@github.com:zephyel/zephyel.github.io.git master

# 如果发布到 https:/USERNAME.github.io/<REPO>REPO=github上的项目
# git push -f git@github.com:USERNAME/<REPO>.git master:gh-pages


# 返回项目根目录
cd -
echo "🏁 部署完成！访问 https://zephyel177.xyz ✨"


