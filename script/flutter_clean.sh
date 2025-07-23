#!/bin/bash

# Start from the current directory or pass a base directory as the first argument
BASE_DIR="${1:-.}"

echo "Searching for Flutter projects in: $BASE_DIR"

# Find all directories containing a pubspec.yaml file (indicates a Flutter project)
find "$BASE_DIR" -type f -name "pubspec.yaml" | while read pubspec; do
  PROJECT_DIR=$(dirname "$pubspec")
  echo "Cleaning Flutter project at: $PROJECT_DIR"
  (
    cd "$PROJECT_DIR" || exit
    flutter clean
  )
done

echo "All Flutter projects cleaned!"
