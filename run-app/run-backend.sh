#!/usr/bin/env bash

# Go to shared folder where the binary file is ubicated
cd /shared

# Define Environment variables
sudo echo 'export PORT=4001' >> /etc/profile

# Execute the binary file on background
cd /shared/
nohup ./vuego-demoapp > server.out 2>&1 &

# To verify correct execution of the process
ps -aux
echo $PORT