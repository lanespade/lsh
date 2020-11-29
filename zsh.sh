#!/bin/zsh
set -Eeuo pipefail

echo 'Installing zsh-autosuggestions'
ZSH_AUTOSUGGESTIONS_PLUGIN_DIR=~/.zsh/zsh-autosuggestions
rm -rf $ZSH_AUTOSUGGESTIONS_PLUGIN_DIR
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_AUTOSUGGESTIONS_PLUGIN_DIR

echo 'Installing fzf-tab'
FZF_TAB_PLUGIN_DIR=~/.zsh/fzf-tab
rm -rf $FZF_TAB_PLUGIN_DIR
git clone --depth 1 https://github.com/Aloxaf/fzf-tab $FZF_TAB_PLUGIN_DIR

echo 'Installing forgit'
FORGIT_PLUGIN_DIR=~/zsh/forgit
rm -rf $FORGIT_PLUGIN_DIR
git clone --depth 1 https://github.com/wfxr/forgit.git $FORGIT_PLUGIN_DIR

echo 'Installing zsh-syntax-highlighting'
ZSH_SYNTAX_HIGHLIGHTING_PLUGIN_DIR
rm -rf $ZSH_SYNTAX_HIGHLIGHTING_PLUGIN_DIR
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_SYNTAX_HIGHLIGHTING_PLUGIN_DIR

echo 'Copying .zshrc'
cp $(dirname $0)/.zshrc $HOME/.zshrc

echo 'Sourcing .zshrc'
exec /bin/zsh
