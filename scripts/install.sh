#!/usr/bin/env bash

# UPDATE REPOSITORIES
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

# INSTALL JAVA
sudo apt install -y oracle-java8-set-default

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

############################################
# INSTALL DYNAMODB AND INIT UBUNTU
############################################

# GOTO HOME
cd /home/vagrant/

# CREATE FOLDER
mkdir -p dynamodb && cd dynamodb

# DOWNLOAD DYNAMODB 
wget https://s3.ap-south-1.amazonaws.com/dynamodb-local-mumbai/dynamodb_local_latest.tar.gz

# EXTRACT DYNAMODB
tar -xvzf dynamodb_local_latest.tar.gz

# CREATE FILE INIT DYNAMODB
cat >> dynamodblocal.conf << EOF
description "DynamoDB Local"

start on (local-filesystems and runlevel [2345])
stop on runlevel [016]

chdir /home/vagrant/dynamodb

setuid ubuntu
setgid ubuntu

exec java -Djava.library.path=. -jar DynamoDBLocal.jar -sharedDb
EOF

# INIT DYNAMODB
sudo cp /home/user/dynamodb/dynamodblocal.conf /etc/init/dynamodblocal.conf
sudo service dynamodblocal start

############################################
# DYNAMODB END
############################################

# CLONE EXAMPLE
cd /home/vagrant/Code
git clone https://github.com/jonaskreling/awslambdaexample.git

# INIT PROJECT EXAMPLE
cd awslambdaexample
# sam local start-api --host 0.0.0.0

# TEST
# curl http://localhost:3000/products
