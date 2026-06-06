#!/bin/bash
# Run this whenever idle-game.html is updated to sync changes into the app
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cp ~/claude/idle-skiller/idle-game.html "$SCRIPT_DIR/www/index.html"
cd "$SCRIPT_DIR"
npx cap sync
echo "App synced with latest idle-game.html"
