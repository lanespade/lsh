#!/bin/zsh
set -Eeuxo pipefail

echo '==== brew ===='
zsh brew.zsh

echo '==== ignore ===='
zsh ignore.zsh

echo '==== npm ===='
zsh npm.zsh

echo '==== zshrc ===='
zsh zshrc.zsh

echo '==== terminal ===='
zsh terminal.zsh
