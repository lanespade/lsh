#!/bin/zsh
set -Eeuo pipefail

echo 'Installing homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Adding homebrew to PATH'
LINE='eval "$(/opt/homebrew/bin/brew shellenv)"'
grep -xqF $LINE  ~/.zprofile || echo $LINE >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo 'Installing brews'
brew reinstall fzf
brew reinstall ripgrep
brew reinstall fd
brew reinstall bat
brew reinstall tree

# Need to manually install until the following is fixed
# https://github.com/spaceship-prompt/spaceship-prompt/issues/1057
# brew reinstall spaceship

echo 'Configuring brews'
$(brew --prefix)/opt/fzf/install --all

echo 'Tapping casks'
brew tap homebrew/cask-fonts

echo 'Installing casks'
brew reinstall homebrew/cask-fonts/font-fira-code
