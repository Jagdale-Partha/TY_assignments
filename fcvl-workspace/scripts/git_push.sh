#!/usr/bin/env bash
set -e

# --- Configuration Variables ---
TARGET_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "main")
# Use the first parameter as the commit message, fallback to timestamp if empty
COMMIT_MSG="${1:-"Auto-update: $(date '+%Y-%m-%d %H:%M:%S')"}"

echo "==> Staging all changes..."
git add -A

# Check if there are any staged changes to commit
if git diff-index --quiet HEAD --; then
    echo "==> No changes detected. Nothing to commit."
    exit 0
fi

echo "==> Committing with message: '$COMMIT_MSG'..."
git commit -m "$COMMIT_MSG"

echo "==> Pushing to origin/$TARGET_BRANCH..."
git push origin "$TARGET_BRANCH"

echo "==> Successfully pushed to origin/$TARGET_BRANCH."