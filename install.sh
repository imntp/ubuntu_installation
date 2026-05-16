#!/bin/bash

# Author: phatnt
# Description: Install necessary packages and tools for development
# Created: 2024-06-01

source scripts/common/common.sh

# Check sudo
check_sudo

log_info "Updating package lists and upgrading existing packages..."
sudo apt-get update > /dev/null
sudo apt-get -y upgrade > /dev/null

log_info "Installing necessary packages for development..."
install_package "build-essential"
install_package "curl"
install_package "git"
install_package "checkinstall"
install_package "pkg-config"
install_package "automake"

# Install tools
install_tool "vscode.sh"
install_tool "bamboo_ibus.sh"