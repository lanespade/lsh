#!/bin/zsh
set -euxo pipefail

echo '==== brew ===='
sh brew.sh

echo '==== ignore ===='
sh ignore.sh

echo '==== zsh ===='
sh zsh.sh

echo '==== nvm ===='
sh nvm.sh

echo '==== npm ===='
sh npm.sh
