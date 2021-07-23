#!/bin/zsh

echo 'Ensuring ~/.zshrc exists'
touch ~/.zshrc

echo 'Configuring ~/.nvmrc'
echo 'stable' > ~/.nvmrc

echo 'Installing nvm'
ZSH_NVM_PLUGIN_DIR=~/.zsh/zsh-nvm
rm -rf $ZSH_NVM_PLUGIN_DIR
git clone --depth 1 https://github.com/lukechilds/zsh-nvm.git $ZSH_NVM_PLUGIN_DIR
source $ZSH_NVM_PLUGIN_DIR/zsh-nvm.plugin.zsh

echo 'Installing npm'
nvm install
