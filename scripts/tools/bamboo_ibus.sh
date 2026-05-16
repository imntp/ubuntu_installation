#!/bin/bash

# Author: phatnt
# Description: Install Bamboo IBus input method
# Reference: https://github.com/BambooEngine/ibus-bamboo

install_ibus_bamboo () {
    echo -e "\n" | sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
    sudo apt-get update
    sudo apt-get install -y ibus ibus-bamboo --install-recommends
    ibus restart
    env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"
}

install_custom_package install_ibus_bamboo "ibus-bamboo"