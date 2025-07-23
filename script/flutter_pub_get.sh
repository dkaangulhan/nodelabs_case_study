#!/bin/bash

# Start from the current directory or use the one provided as an argument
BASE_DIR="${1:-.}"

echo "Searching for Flutter projects in: $BASE_DIR"

# Find all directories with pubspec.yaml (Flutter project indicator)
find "$BASE_DIR" -type f -name "pubspec.yaml" | while read pubspec; do
  PROJECT_DIR=$(dirname "$pubspec")
  echo ""
  echo "➡️ Processing project at: $PROJECT_DIR"

  (
    cd "$PROJECT_DIR" || exit
    echo "🔄 Running flutter clean..."
    flutter clean

    echo "📦 Running flutter pub get..."
    flutter pub get

    echo "✅ Done: $PROJECT_DIR"
  )
done

echo ""
echo "🚀 All Flutter projects cleaned and dependencies fetched!"
