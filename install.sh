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
INSTALL_DIR="$MPV_CONFIG"
if [ -d "$MPV_CONFIG" ]; then
    echo "  [!] Existing mpv config found at $MPV_CONFIG"
    echo ""
    printf "  Copy into a subfolder instead so you can inspect it manually? [y/N] "
    read -r subfolder
    if [[ "$subfolder" =~ ^[Yy]$ ]]; then
        printf "  Subfolder name [default: mpv-conf-new]: "
        read -r folder_name
        folder_name="${folder_name:-mpv-conf-new}"
        INSTALL_DIR="$MPV_CONFIG/$folder_name"
        echo ""
        echo "  Files will be copied to: $INSTALL_DIR"
        echo "  You can inspect and move them to $MPV_CONFIG manually later."
    else
        echo ""
        echo "  Existing files will NOT be overwritten."
    fi
fi

echo ""

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
mkdir -p "$INSTALL_DIR"
cp -rn "$TMP/mpv-conf-main/." "$INSTALL_DIR/"
echo "        Done."

# Cleanup
rm -rf "$TMP" "$TMP.zip"

echo ""
echo "  mpv config installed successfully!"
echo "  Location: $INSTALL_DIR"
echo ""
