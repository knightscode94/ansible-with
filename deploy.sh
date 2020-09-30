#!/bin/sh
#update
sudo apt update && sudo apt upgrade -y

#kompose
curl -L https://github.com/kubernetes/kompose/releases/download/v1.21.0/kompose-linux-amd64 -o kompose
chmod +x kompose
sudo mv ./kompose /usr/local/bin/kompose

#ansible
mkdir -p ~/.local/bin
echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
pip3 install -y --user ansible

#docker
curl https://get.docker.com | sudo bash
sudo usermod -aG docker $(whoami)

#docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#nginx
sudo apt install -y nginx

#minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo apt install minikube-linux-amd64 /usr/local/bin/minikube

#terraform
sudo apt install -y unzip wget
wget https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_linux_amd64.zip
unzip terraform_*_linux_*.zip
sudo mv terraform /usr/local/bin
rm terraform_*_linux_*.zip

#git clone
git clone https://github.com/FP-T4/DevOps-Final.git