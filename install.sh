#!/bin/zsh
set -Eeuo pipefail

echo '==== brew ===='
sh brew.sh

echo '==== fd ===='
sh fd.sh

echo '==== zsh ===='
sh zsh.sh

echo '==== nvm ===='
sh nvm.sh

echo '==== npm ===='
sh npm.sh
