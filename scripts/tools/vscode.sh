#!/bin/bash

# Author: phatnt
# Description: Install Visual Studio Code
# Reference: https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-20-04/
# Created: 2026-May-16


install_vscode () {
    sudo apt install software-properties-common apt-transport-https wget
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/packages.microsoft.gpg
    echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
    sudo apt update
    sudo apt install -y code
}

install_custom_package install_vscode "code"
