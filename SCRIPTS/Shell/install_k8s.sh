#!/bin/bash

set -euf -o pipefail

echo "Installing Kubernetes Tools" 
    function install_kubernetes {
        sudo apt-get update && sudo apt-get install -y apt-transport-https
        echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
        curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
        sudo apt-get update && sudo apt-get install -y kubectl && sudo apt-get install -y kubeadm && sudo apt-get install -y kubelet
    }

echo "Executing functions"
    function firstboot {
        install_kubernetes
    }
echo  "$(date +"%T") - Starting Script" 
    # Changing to root directory to proceed
    cd /root||exit 1

    if [ ! -f "${PWD}"/firstboot.key ]
    then
        firstboot
        touch "${PWD}"/firstboot.key
    else
        echo "firstboot script already been executed" 
    fi

    if [ ! -f "${PWD}"/osupdate.key ]
    then
        exit 0
    else
        echo "update main components"
        osupdate
        exit 0
    fi
