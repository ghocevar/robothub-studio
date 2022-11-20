#!/bin/bash

set -e

yarn gulp vscode-reh-web-linux-x64-min
yarn gulp vscode-reh-web-linux-arm64-min

START_DIR="$(pwd)"
cd ..

mv vscode-reh-web-linux-x64 robothub-studio-x86_64
mv vscode-reh-web-linux-arm64 robothub-studio-aarch64

tar cfJ robothub-studio-x86_64.tar.xz robothub-studio-x86_64
rm -rf robothub-studio-x86_64
mv robothub-studio-x86_64.tar.xz "${START_DIR}/"

tar cfJ robothub-studio-aarch64.tar.xz robothub-studio-aarch64
rm -rf robothub-studio-aarch64
mv robothub-studio-aarch64.tar.xz "${START_DIR}/"
