#!/usr/bin/env bash
# Push game to all three remotes.
# - Syncs www/index.html for the app build
# - Pushes dev, origin (public), and app in order

set -e
cd "$(git rev-parse --show-toplevel)"

echo "📦 Syncing app file..."
cp idle-game.html www/index.html
git add www/index.html

if git diff --cached --quiet; then
  echo "   www/index.html already up to date"
else
  git commit -m "Sync www/index.html with latest idle-game.html

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
  echo "   Sync commit created"
fi

echo "🔒 Pushing to dev..."
git push --force-with-lease dev master

echo "🌐 Pushing to origin (public)..."
git push origin master

echo "📱 Pushing to app..."
git push app master

echo ""
echo "✅ Done — all three remotes in sync."
