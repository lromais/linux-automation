#!/bin/bash

    export DEBIAN_FRONTEND=noninteractive
    # Especify docker-compose version to install on firstboot
    export COMPOSE_VERSION=1.22.0


#FUNCTIONS
echo "Checking memory and swap Parameters"
    function verify_memory {
        # Verifies how much swap memory needs to be allocated
        if [ $(free -m| grep  Mem | awk '{ print int($2) }') -lt "1024" ]
         then
            SWAP=2G
            SWAPPINESS=60
        elif [ $(free -m| grep  Mem | awk '{ print int($2) }') -gt "1024" ] && [ $(free -m| grep  Mem | awk '{ print int($2) }') -lt "2048" ]
         then
            SWAP=3G
            SWAPPINESS=40
        else
            SWAP=4G
            SWAPPINESS=10
        fi
    }

    function config_swap {
        verify_memory
        fallocate -l ${SWAP} /swapfile
        chmod 600 /swapfile
        mkswap /swapfile
        swapon /swapfile
        echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
        echo 'vm.swappiness='${SWAPPINESS}'' | tee -a /etc/sysctl.conf
        echo 'vm.vfs_cache_pressure=50' | tee -a /etc/sysctl.conf
        sysctl -p #reload kernel
    }

echo "OS Basic components"
    function update_os {
        sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y
    }
    function install_basic_tools {
        sudo apt-get install -y dirmngr software-properties-common apt-transport-https ca-certificates ca-certificates curl gnupg2 nmon htop sysstat iptraf-ng wget telnet ftp git lsof iotop vim jq
    }
    function install_python3 {
        sudo apt install python3 -y && sudo apt install python3-pip -y
    }
    function install_ansible {
        sudo apt install ansible -y
    }
    function install_zsh { 
        sudo apt install zsh -y
    }    
    #function configure_zsh {
    #sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    #}


#echo "Installing Kubernetes Tools" 
#    function install_kubernetes {
#        sudo apt-get update && sudo apt-get install -y apt-transport-https
#        export KUBERNETES_REPO="kubernetes-$(lsb_release -c -s)"
#        echo "deb https://apt.kubernetes.io/ $KUBERNETES_REPO main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
#        curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#        sudo apt-get update && sudo apt-get install -y kubectl && sudo apt-get install -y kubeadm && sudo apt-get install -y kubelet
#    }

echo "Installing Docker-CE & Compose"
    function install_docker {
        #apt-get remove docker docker-engine docker.io
        #curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        #add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        #apt-get update && apt-get install -y docker-ce
        curl -sSL https://get.docker.com/ | sudo sh 
    }
sudo usermod -aG docker $USER

    function install_docker_compose {
        curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
    }

    function docker_compose_update {
        #update_os
        # Update Docker Compose (Always verify the latest release)
        COMPOSE_VERSION=`cat ${PWD}/osupdate.key|grep COMPOSE_VERSION|awk -F"=" '{ print $ 2}'`
        curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
    }    

echo "Installing Kubernetes Tools" 
    function install_kubernetes {
        sudo apt-get update && sudo apt-get install -y apt-transport-https
        echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
        curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
        sudo apt-get update && sudo apt-get install -y kubectl && sudo apt-get install -y kubeadm && sudo apt-get install -y kubelet
    }
echo "Installing Gitlab-Runner"   
    function install_gitlab_runner {
        # Install gitlab-runner
        curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash
        apt-get install -y gitlab-runner

        # Make docker availabe to run with gitlab-runner account
        gpasswd -a gitlab-runner docker
        printf '%s\n' '#!/bin/sh -e' \
        'chmod 777 /var/run/docker.sock' \
        'exit 0' > /etc/rc.local
        chmod +x /etc/rc.local
        systemctl daemon-reload
        systemctl enable rc-local
        systemctl start rc-local
        systemctl status rc-local
        
        # Make gitlab-runner account to run root commands without sudo
        echo "gitlab-runner ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers
        echo "bernardo ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers
    }

echo "Performing Cloud Installation Packages - GCP and AWS!!"
# GCP INSTALL
# Create environment variable for correct distribution
# Add the Cloud SDK distribution URI as a package source
# Import the Google Cloud Platform public key
# Update the package list and install the Cloud SDK

    function install_gcp {
        export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
        echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
        curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
        sudo apt-get update && sudo apt-get install google-cloud-sdk -y
    }

    function install_aws_cli {
        pip3 install awscli
}


echo "Executing functions"
    function firstboot {
        config_swap
        update_os
        install_basic_tools
        install_python3
        install_ansible
        install_zsh
        #configure_zsh
        install_docker
        install_docker_compose
        docker_composer_update
        install_kubernetes
        install_gitlab_runner
        install_gcp
        install_aws_cli
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
