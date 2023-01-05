#!/bin/bash

set -e

yarn gulp vscode-reh-web-linux-${CODE_ARCH}-min

START_DIR="$(pwd)"
cd ..

mv vscode-reh-web-linux-${CODE_ARCH} robothub-studio-${LINUX_ARCH}

tar cfJ robothub-studio-${LINUX_ARCH}.tar.xz robothub-studio-${LINUX_ARCH}
rm -rf robothub-studio-${LINUX_ARCH}
mv robothub-studio-${LINUX_ARCH}.tar.xz "${START_DIR}/"
