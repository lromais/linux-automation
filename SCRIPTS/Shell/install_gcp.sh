#EXTRA FOR UBUNTU 
# GCP INSTALL
# Create environment variable for correct distribution
# Add the Cloud SDK distribution URI as a package source
# Import the Google Cloud Platform public key
# Update the package list and install the Cloud SDK

#FUNCTIONS

    function install_gcp {
        export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
        echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
        curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
        sudo apt-get update && sudo apt-get install google-cloud-sdk
    }

install_gcp()
