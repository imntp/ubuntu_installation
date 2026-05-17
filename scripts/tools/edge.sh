#!/bin/bash

# Author: phatnt
# Description: Install microsoft edge stable
# Reference: https://www.omgubuntu.co.uk/2021/01/how-to-install-edge-on-ubuntu-linux
# Created: 2026-May-16


install_edge () {
    sudo apt install software-properties-common apt-transport-https wget
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/packages.microsoft.gpg
    echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" | sudo tee /etc/apt/sources.list.d/microsoft-edge-dev.list
    sudo apt update
    sudo apt install -y microsoft-edge-stable
}

install_custom_package install_edge "microsoft-edge-stable"
