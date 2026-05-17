# !/bin/bash

# Author: phatnt
# Description: Install Grafana on Ubuntu
# Reference: https://grafana.com/docs/grafana/latest/installation/debian/
# Created: 2026-May-17

install_grafana() {
    sudo apt-get install -y apt-transport-https wget gnupg
    wget -O /etc/apt/keyrings/grafana.asc https://apt.grafana.com/gpg-full.key
    sudo chmod 644 /etc/apt/keyrings/grafana.asc
    echo "deb [signed-by=/etc/apt/keyrings/grafana.asc] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
    sudo apt-get update
    sudo apt-get install -y grafana
    sudo systemctl enable grafana-server
    sudo systemctl start grafana-server
}

install_custom_package install_grafana "grafana"
