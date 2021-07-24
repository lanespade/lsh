#!/bin/zsh
set -Eeuxo pipefail

echo 'Installing homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Adding homebrew to PATH'
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/l/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo 'Installing brews'
brew reinstall fzf
brew reinstall ripgrep
brew reinstall fd
brew reinstall bat
brew reinstall tree
brew reinstall spaceship

echo 'Configuring brews'
$(brew --prefix)/opt/fzf/install --all

echo 'Installing casks'
brew reinstall homebrew/cask-fonts/font-fira-code
