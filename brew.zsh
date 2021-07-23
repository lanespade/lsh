#!/bin/zsh
set -Eeuxo pipefail

echo 'Installing homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
