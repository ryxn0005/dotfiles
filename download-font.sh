#!/bin/bash

# Define install directory
FONT_DIR="$HOME/.local/share/fonts/NerdFonts"
REPO="ryanoasis/nerd-fonts"

# Check for dependencies
if ! command -v curl &>/dev/null || ! command -v unzip &>/dev/null; then
  echo "Error: 'curl' and 'unzip' are required."
  exit 1
fi

# Create directory
mkdir -p "$FONT_DIR"

echo "Fetching latest release info from GitHub..."
LATEST_RELEASE_JSON=$(curl -s "https://api.github.com/repos/$REPO/releases/latest")

# Extract URLs for zip files (excluding source code)
URLS=$(echo "$LATEST_RELEASE_JSON" | grep -oP '"browser_download_url": "\K[^"]+' | grep -E '\.zip$')

if [ -z "$URLS" ]; then
  echo "Error: No download URLs found. You might be API rate-limited."
  exit 1
fi

COUNT=$(echo "$URLS" | wc -l)
CURRENT=0

echo "Found $COUNT font families. Starting download and install..."

for url in $URLS; do
  ((CURRENT++))
  FILENAME=$(basename "$url")
  FONT_NAME="${FILENAME%.zip}"

  # Create a subfolder for each font to keep things organized
  INSTALL_PATH="$FONT_DIR/$FONT_NAME"
  mkdir -p "$INSTALL_PATH"

  echo "[$CURRENT/$COUNT] Processing $FONT_NAME..."

  # Download zip to temp file
  curl -L -s -o "/tmp/$FILENAME" "$url"

  # Unzip into specific folder
  unzip -q -o "/tmp/$FILENAME" -d "$INSTALL_PATH"

  # Clean up zip
  rm "/tmp/$FILENAME"
done

echo "------------------------------------------------"
echo "Refreshing font cache..."
fc-cache -fv

echo "Done! All Nerd Fonts have been installed to $FONT_DIR"
