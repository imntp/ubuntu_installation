#!/bin/bash

# Author: phatnt
# Description: Activate Bamboo IBus input method
# Created: 2026-May-16

export $(dbus-launch)
killall -9 ibus-daemon
ibus-daemon -drx
sleep 3
ibus restart
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"

