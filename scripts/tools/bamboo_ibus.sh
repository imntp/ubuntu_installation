#!/bin/bash

# Author: phatnt
# Description: Install Bamboo IBus input method
# Reference: https://github.com/BambooEngine/ibus-bamboo
# Created: 2026-May-16

install_ibus_bamboo () {
    echo -e "\n" | sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
    sudo apt-get update
    sudo apt-get install -y ibus ibus-bamboo --install-recommends
}

install_custom_package install_ibus_bamboo "ibus-bamboo"
