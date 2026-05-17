#!/bin/bash

# Author: phatnt
# Description: Common functions and variables for scripts
# Created: 2026-May-16

ROOT_FOLDER=$(cd $(dirname "${BASH_SOURCE[0]}")/../.. && pwd)
SCRIPTS_FOLDER="$ROOT_FOLDER/scripts"
TOOLS_FOLDER="$SCRIPTS_FOLDER/tools"
COMMON_FOLDER="$SCRIPTS_FOLDER/common"

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
    version=$(dpkg -l "$1" 2>/dev/null | awk '/^ii/{print $3}') 
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

install_custom_package () {

    version=$(get_package_version $2)
    if [[ -n "$version" ]]; then
        log_ready "Already installed $2-$version"
    else
        log_info "Installing $2..."

        "$@" > /dev/null

        version=$(get_package_version $2)
        if [[ -n "$version" ]]; then
            log_success "Installed $2-$version successfully!"
        else
            log_error "Failed to install $2"
            exit 1
        fi
    fi
}

install_tool () {
    cd $TOOLS_FOLDER
    log_info "Running $1..."
    bash -E "$1" 
}

export ROOT_FOLDER SCRIPTS_FOLDER TOOLS_FOLDER COMMON_FOLDER
export BBlue BGreen BRed BYellow NC

export -f log_info
export -f log_ready
export -f log_success
export -f log_error
export -f log_warning
export -f check_sudo

export -f install_package
export -f get_package_version
export -f install_custom_package
export -f install_tool