#!/usr/bin/env bash

# UPDATE REPOSITORIES
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

# INSTALL GIT
sudo apt install -y git

# CLONE EXAMPLE
cd /home/vagrant/Code
git clone https://github.com/jonaskreling/awslambdaexample.git

# INIT PROJECT EXAMPLE
cd awslambdaexample
# sam local start-api --host 0.0.0.0

# TEST
# curl http://localhost:3000/products
