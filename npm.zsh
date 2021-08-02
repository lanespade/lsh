#!/bin/zsh
set -Eeo pipefail

echo 'Ensuring ~/.zshrc exists'
touch ~/.zshrc

echo 'Installing nvm'
ZSH_NVM_PLUGIN_DIR=~/.zsh/zsh-nvm
rm -rf $ZSH_NVM_PLUGIN_DIR
git clone --depth 1 https://github.com/lukechilds/zsh-nvm.git $ZSH_NVM_PLUGIN_DIR
source $ZSH_NVM_PLUGIN_DIR/zsh-nvm.plugin.zsh

echo 'Configuring ~/.nvmrc'
echo 'stable' > ~/.nvmrc

echo 'Installing npm'
nvm install
