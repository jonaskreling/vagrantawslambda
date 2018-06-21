#!/usr/bin/env bash

# UPDATE
sudo apt-get update

# INSTALL PIP
sudo apt-get install -y python-pip

# INSTALL NODEJS AND NPM
sudo apt install -y nodejs
sudo apt install -y npm

# INSTALL AWS-CLI
pip install awscli

# INSTALL DOCKER
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -a -G docker $USER
sudo usermod -a -G docker vagrant

# INSTALL AWS-SAM-CLI
pip install aws-sam-cli
