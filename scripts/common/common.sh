#!/bin/bash

# Author: phatnt
# Description: Common functions and variables for scripts
# Created: 2024-06-01

BBlue='\033[1;34m'
BGreen='\033[1;32m'
BRed='\033[1;31m'
BYellow='\033[1;33m'
BWhite='\033[1;37m'
NC='\033[0m'

log_info () {
    echo -e "${BWhite}[INFO] $1${NC}"
}

log_ready () {
    echo -e "${BBlue}[INSTALLED] $1${NC}"
}

log_success () {
    echo -e "${BGreen}[SUCCESS] $1${NC}"
}

log_error () {
    echo -e "${BRed}[ERROR] $1${NC}"
}

log_warning () {
    echo -e "${BYellow}[WARNING] $1${NC}"
}

check_sudo () {
    if [[ "$SUDO_USER" == "" ]]; then
        log_error "This script should be run with sudo privileges. Use 'sudo bash' before execute this script!"
        exit 1
    fi
}

get_package_version () {
    version=$(dpkg -s $1 | grep Version) 
    version=${version:9:-1}
    if [[ -n "$version" ]]; then
        echo "$version"
    else
        echo ""
    fi
}

install_package () {
    version=$(get_package_version $1)
    if [[ -n "$version" ]]; then
        log_ready "Already installed $1-$version"
    else
        log_info "Installing $1..."
        sudo apt-get -y install $1 > /dev/null

        # Check if the installation was successful
        version=$(get_package_version $1)
        if [[ -n "$version" ]]; then
            log_success "Installed $1-$version successfully!"
        else
            log_error "'sudo apt-get -y install $1' failed!"
            exit 1
        fi
    fi
}

export BBlue BGreen BRed BYellow NC
export -f install_package
export -f get_package_version
export -f log_info
export -f log_ready
export -f log_success
export -f log_error
export -f log_warning
export -f check_sudo
