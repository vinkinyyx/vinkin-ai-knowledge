#!/bin/bash
# sync-index.sh — 同步 menu.html 到 index.html 并推 GitHub Pages
# 用法: ./sync-index.sh
# 作用: 让根 URL 永远显示 menu.html 最新内容

set -e

# 切换到脚本所在目录
cd "$(dirname "$0")"

# 1. 同步 menu.html → index.html
if [ ! -f "menu.html" ]; then
  echo "❌ menu.html 不存在，无法同步"
  exit 1
fi

cp menu.html index.html
echo "✅ menu.html → index.html 同步完成（$(wc -c < menu.html) 字节）"

# 2. 检查是否有变更
if git diff --quiet index.html; then
  echo "ℹ️  index.html 无变更，无需提交"
  exit 0
fi

# 3. 自动 commit + push
git add index.html
git commit -m "sync: index.html 同步 menu.html（v3.$(date +%s)）"
git push origin main

echo "✅ 已推 GitHub Pages（commit 见上）"
echo "⏱️  GitHub Pages 同步需 30-60 秒"
