#!/bin/bash
echo "#### INSTALLING DOCKER ####"
curl -sSL https://get.docker.com/ | sh 
sudo usermod -aG docker $USER  
newgrp docker
echo "#### INSTALLING KUBECTL ####"
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl 
chmod +x ./kubectl 
sudo mv ./kubectl /usr/local/bin/kubectl 
echo "#### INSTALLING KUBECTX ####"
curl -LO https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx 
chmod +x kubectx 
sudo mv kubectx /usr/bin/kubectx 
echo "#### INSTALLING KUBENS ####"
curl -LO https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens 
chmod +x kubens 
sudo mv kubens /usr/bin/kubens 
echo "#### SETUP K ALIAS ####"
echo "alias k='kubectl'" > ~/.bash_aliases 
source ~/.bashrc 
echo "#### INSTALLING HELM ####"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
echo "#### INSTALLING KIND ####"
curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64" 
chmod +x ./kind 
sudo mv ./kind /usr/bin/kind
kind create cluster --name training-airflow
echo "#### INSTALLING K9S ####"
sudo apt install snapd -y
sudo snap install k9s
