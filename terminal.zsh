#!/bin/zsh
set -Eeuo pipefail

echo 'Configuring terminal'
cp com.apple.Terminal.plist ~/Library/Preferences
cp -R com.apple.Terminal.savedState ~/Library/Saved\ Application\ State
