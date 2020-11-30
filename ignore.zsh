#!/bin/zsh
set -Eeuxo pipefail

echo 'Copying .ignore'
cp -f $(dirname $0)/.ignore $HOME
