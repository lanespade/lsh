#!/bin/zsh
set -Eeuo pipefail

echo 'Installing zsh-autosuggestions'
rm -rf ~/.zsh/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions

echo 'Installing fzf-tab'
rm -rf ~/.zsh/fzf-tab
git clone --depth 1 https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab

echo 'Installing forgit'
rm -rf ~/.zsh/forgit
git clone --depth 1 https://github.com/wfxr/forgit.git ~/.zsh/forgit

echo 'Copying .zshrc'
cp $(dirname $0)/.zshrc $HOME/.zshrc

echo 'Sourcing .zshrc'
exec /bin/zsh
