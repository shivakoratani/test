#!/bin/bash

# install jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb http://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
apt-get update
apt-get install -y jenkins=${JENKINS_VERSION} unzip

# install pip
wget -q https://bootstrap.pypa.io/get-pip.py
python get-pip.py
python3 get-pip.py
rm -f get-pip.py
# install awscli
pip install awscli

# install terraform
cd /usr/local/bin
wget -q https://releases.hashicorp.com/terraform/0.7.7/terraform_0.7.7_linux_amd64.zip
unzip terraform_0.7.7_linux_amd64.zip
# install packer
wget -q https://releases.hashicorp.com/packer/0.10.2/packer_0.10.2_linux_amd64.zip
unzip packer_0.10.2_linux_amd64.zip
# clean up
apt-get clean
rm terraform_0.7.7_linux_amd64.zip
rm packer_0.10.2_linux_amd64.zip
