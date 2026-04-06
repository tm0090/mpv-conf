#!/bin/bash

MPV_CONFIG="$HOME/.config/mpv"
REPO="https://github.com/yourname/yourrepo"
TMP="/tmp/mpv-config-tmp"

echo "Fetching config..."
git clone --depth=1 "$REPO" "$TMP"

mkdir -p "$MPV_CONFIG"

echo "Copying files (skipping existing)..."
cp -rn "$TMP"/. "$MPV_CONFIG"/

rm -rf "$TMP"

echo "Done! Config installed to $MPV_CONFIG"
