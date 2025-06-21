#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e


# 生成静态文件
echo "📦 开始构建 VuePress 静态文件..."
pnpm docs:build
echo "✅ 构建完成！"


# 推送 test_docs源码到 main分支 (git插件需要)
echo "📂 推送my-docs源码到main分支..."
git add -A
git commit -m "test_docs $(date '+%Y-%m-%d %H:%M:%S')"
git push https://github.com/zephyel/mydocs.git main                 #使用 HTTPS(需要 token)
# git push git@github.com:zephyel/mydocs.git main                   #使用 SSH


# 将 dist目录推送到 gh-pages分支
echo "📂 推送dist目录到gh-pages分支..."
cd src/.vuepress/dist
git init
git add -A
git commit -m "deploy $(date '+%Y-%m-%d %H:%M:%S')"
# 如果你想要部署到 https://USERNAME.github.io
# git push -f https://github.com/zephyel/zephyel.github.io.git master      #使用 HTTPS(需要 token)
# git push -f git@github.com:zephyel/zephyel.github.io.git master          #使用 SSH
# 如果发布到 https://USERNAME.github.io/<REPO>REPO=github上的项目
git push -f https://github.com/zephyel/mydocs.git master:gh-pages          #使用 HTTPS(需要 token)
# git push -f git@github.com:zephyel/mydocs.git master:gh-pages            #使用 SSH


# 返回项目根目录
cd -
echo "🏁 部署完成！访问 https://zephyel.github.io/mydocs ✨"






