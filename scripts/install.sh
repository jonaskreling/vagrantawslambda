#!/usr/bin/env bash

# UPDATE REPOSITORIES
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

# INSTALL UNZIP
sudo apt install unzip

############################################
# INSTALL JAVA
############################################

# GOTO HOME
cd /home/vagrant/

# CREATE FOLDER
mkdir -p oraclejava && cd oraclejava

# CLONE INSTALLER JAVA
git clone https://github.com/chrishantha/install-java.git

# DOWNLOAD ORACLE JAVA
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz

# RUN
yes | sudo ./install-java/install-java.sh -f ./jdk-8u131-linux-x64.tar.gz

echo "Instalação JAVA FINALIZADA!"

############################################
# JAVA END
############################################

# GOTO HOME
cd /home/vagrant/

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
sudo cp /home/vagrant/dynamodb/dynamodblocal.conf /etc/init/dynamodblocal.conf
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
