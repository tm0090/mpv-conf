#!/bin/bash

MPV_CONFIG="$HOME/.config/mpv"
ZIP_URL="https://github.com/tm0090/mpv-conf/archive/refs/heads/main.zip"
TMP="/tmp/mpv-config-tmp"

echo "Fetching config..."
curl -fsSL "$ZIP_URL" -o "$TMP.zip"
unzip -q "$TMP.zip" -d "$TMP"

mkdir -p "$MPV_CONFIG"

echo "Copying files (skipping existing)..."
cp -rn "$TMP/mpv-conf-main/." "$MPV_CONFIG/"

rm -rf "$TMP" "$TMP.zip"

echo "Done! Config installed to $MPV_CONFIG"
