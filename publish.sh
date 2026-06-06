#!/usr/bin/env bash
# Push game to all three remotes.
#
# Dev is pushed BEFORE the www/index.html sync commit so it stays
# free of app-build files. Origin and app get the sync commit.

set -e
cd "$(git rev-parse --show-toplevel)"

echo "🔒 Pushing to dev (game commits only)..."
git push dev master

echo "📦 Syncing app file..."
mkdir -p www
cp idle-game.html www/index.html
git add -f www/index.html

if git diff --cached --quiet; then
  echo "   www/index.html already up to date"
else
  git commit -m "Sync www/index.html with latest idle-game.html

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
  echo "   Sync commit created"
fi

echo "🌐 Pushing to origin (public)..."
git push origin master

echo "📱 Pushing to app..."
git push app master

echo ""
echo "✅ Done."
