#!/usr/bin/env bash
# Update idlewright-app with the latest game file.
# Keeps app repo clean — only Capacitor files + www/index.html.

set -e
cd "$(git rev-parse --show-toplevel)"

echo "📦 Syncing www/index.html for app build..."
git show master:idle-game.html > /tmp/idlewright-game.html

git checkout app-clean
cp /tmp/idlewright-game.html www/index.html
git add -f www/index.html

if git diff --cached --quiet; then
  echo "   Already up to date."
else
  git commit -m "Sync www/index.html with latest idle-game.html

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
  echo "   Sync commit created."
fi

echo "📱 Pushing to app..."
git push app app-clean:master

git checkout master
echo ""
echo "✅ App updated."
