#!/bin/bash

MPV_CONFIG="$HOME/.config/mpv"
ZIP_URL="https://github.com/tm0090/mpv-conf/archive/refs/heads/main.zip"
TMP="/tmp/mpv-config-tmp"

echo ""
echo "  mpv-conf installer"
echo "  =================="
echo ""

# Check dependencies
for cmd in curl unzip; do
    if ! command -v $cmd &> /dev/null; then
        echo "  [error] '$cmd' is required but not installed."
        exit 1
    fi
done

echo "  This will install mpv config files to:"
echo "  $MPV_CONFIG"
echo ""
printf "  Continue? [y/N] "
read -r confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo ""
    echo "  Aborted."
    exit 0
fi

echo ""

# Check if config folder already exists
if [ -d "$MPV_CONFIG" ]; then
    echo "  [!] Existing config found. Existing files will NOT be overwritten."
    echo ""
fi

# Download
echo "  [1/3] Downloading..."
curl -fsSL "$ZIP_URL" -o "$TMP.zip"
echo "        Done."

# Extract
echo "  [2/3] Extracting..."
unzip -q "$TMP.zip" -d "$TMP"
echo "        Done."

# Copy
echo "  [3/3] Installing files..."
mkdir -p "$MPV_CONFIG"
cp -rn "$TMP/mpv-conf-main/." "$MPV_CONFIG/"
echo "        Done."

# Cleanup
rm -rf "$TMP" "$TMP.zip"

echo ""
echo "  mpv config installed successfully!"
echo "  Location: $MPV_CONFIG"
echo ""
