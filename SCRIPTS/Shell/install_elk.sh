#!/bin/bash

echo "installing elastic search"
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
    sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
    sudo apt-get install openjdk-8-jre
    sudo apt-get update && sudo apt-get install elasticsearch
echo "Starting Services"

    systemctl daemon-reload
    systemctl enable elasticsearch.service
    systemctl start elasticsearch.service && systemctl status elasticsearch.service
