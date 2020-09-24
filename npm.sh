#!/bin/zsh
set -uxo pipefail

echo 'Unistalling previous global packages'
nvm use system
npm u -g spaceship-prompt

echo 'Installing nvm'
rm -rf ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh

echo 'Installing default'
echo 'stable' >  $HOME/.nvmrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install

echo 'Setting Default'
nvm use

echo 'Installing global packages'
npm i -g spaceship-prompt
