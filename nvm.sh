#!/bin/zsh
set -euxo pipefail

echo 'Installing nvm'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh

echo 'Setting Default'
echo 'stable' >  $HOME/.nvmrc

echo 'Installing default'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install
nvm use
