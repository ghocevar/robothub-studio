#!/bin/bash

set -e

yarn gulp vscode-reh-web-linux-x64-min

START_DIR="$(pwd)"
cd ..

mv vscode-reh-web-linux-x64 robothub-studio-x86_64

tar cfJ robothub-studio-x86_64.tar.xz robothub-studio-x86_64
rm -rf robothub-studio-x86_64
mv robothub-studio-x86_64.tar.xz "${START_DIR}/"
