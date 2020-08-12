#!/bin/bash
set -euxo pipefail

echo 'Copying .ignore'
cp -f $(dirname $0)/.ignore $HOME
