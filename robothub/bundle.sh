#!/bin/bash

set -e

yarn gulp vscode-reh-web-linux-x64-min
yarn gulp vscode-reh-web-linux-arm64-min

START_DIR="$(pwd)"
cd ..

mv vscode-reh-web-linux-x64 robothub-studio-x86_64
mv vscode-reh-web-linux-arm64 robothub-studio-aarch64

wget https://github.com/redhat-developer/vscode-yaml/releases/download/1.10.1/yaml-1.10.1-19523.vsix -P /tmp/
unzip /tmp/yaml-1.10.1-19523.vsix -d /tmp/yaml-1.10.1-19523
rm /tmp/yaml-1.10.1-19523.vsix
cp -r /tmp/yaml-1.10.1-19523/extension ./robothub-studio-x86_64/extensions/vscode-yaml
cp -r /tmp/yaml-1.10.1-19523/extension ./robothub-studio-aarch64/extensions/vscode-yaml
rm -rf /tmp/yaml-1.10.1-19523

wget https://open-vsx.org/api/ms-python/python/2022.18.2/file/ms-python.python-2022.18.2.vsix -P /tmp/
unzip /tmp/ms-python.python-2022.18.2.vsix -d /tmp/ms-python.python-2022.18.2
rm /tmp/ms-python.python-2022.18.2.vsix
cp -r /tmp/ms-python.python-2022.18.2/extension ./robothub-studio-x86_64/extensions/ms-python
cp -r /tmp/ms-python.python-2022.18.2/extension ./robothub-studio-aarch64/extensions/ms-python
rm -rf /tmp/ms-python.python-2022.18.2

tar cfJ robothub-studio-x86_64.tar.xz robothub-studio-x86_64
rm -rf robothub-studio-x86_64
mv robothub-studio-x86_64.tar.xz "${START_DIR}/"

tar cfJ robothub-studio-aarch64.tar.xz robothub-studio-aarch64
rm -rf robothub-studio-aarch64
mv robothub-studio-aarch64.tar.xz "${START_DIR}/"
