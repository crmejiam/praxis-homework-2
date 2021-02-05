#!/usr/bin/env bash

# Install Git
sudo yum install git -y

# Install Go
sudo yum install golang -y

# Install NodeJS and npm
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs -y

# Install Vue cli
yes | npm install -g @vue/cli

# To verify correct installation
echo "Installed version of git"
git --version 
echo "Installed version of go"
go version
echo "Installed version of nodeJS"
node --version
echo "Installed version of npm"
npm --version
echo "Installed version of Vue"
vue --version

# Clone the test application repository
git clone https://github.com/jdmendozaa/vuego-demoapp.git

# Build the Go project
cd vuego-demoapp/server
go build

# Move (copy) the file to the /shared folder
cd / # Goes back to root directory, where shared and vagrant folders are ubicated
cp /home/vagrant/vuego-demoapp/server/vuego-demoapp /shared/ # copy the vuego-demoapp binary file to the shared folder

# Define Environment variables
echo 'export PORT=4001' >> /etc/profile
sudo echo 'VUE_APP_API_ENDPOINT="http://10.0.0.8:4001/api"' >> /home/vagrant/vuego-demoapp/spa/.env.production.local

# Build the Vue app
cd home/vagrant/vuego-demoapp/spa
sudo npm install 
npm run build

# To compress dist folder generated by Vue build and move it to shared folder
tar -zcvf dist.tar.gz ./dist
mv dist.tar.gz /shared/