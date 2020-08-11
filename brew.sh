#!/bin/zsh
set -Eeuo pipefail

echo 'Installing homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'Installing brews'
brew reinstall fzf
brew reinstall ripgrep
brew reinstall fd
brew reinstall bat
brew reinstall tree

echo 'Configuring brews'
$(brew --prefix)/opt/fzf/install --all

echo 'Installing casks'
brew cask reinstall font-fira-code
