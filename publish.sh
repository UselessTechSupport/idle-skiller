#!/usr/bin/env bash
# Push game to dev and origin (public).
# The app repo (idlewright-app) is a separate Capacitor project.
# To update the app, run: bash update-app.sh

set -e
cd "$(git rev-parse --show-toplevel)"

echo "🔒 Pushing to dev..."
git push dev master

echo "🌐 Pushing to origin (public)..."
git push origin master

echo ""
echo "✅ Done."
