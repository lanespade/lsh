#!/bin/bash
set -Eeuo pipefail

echo 'Copying .ignore'
cp -f $(dirname $0)/.ignore $HOME
