#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y upgrade ansible

# install pip
apt-get -y install python-pip

# install docker
apt-get -y install docker.io
pip install --upgrade docker
pip install --upgrade docker-py

apt-get -y install dos2unix

# install awscli
pip install --upgrade awscli

# Setup rsyslog
cp /vagrant/artifacts/rsyslog.conf /etc/
service rsyslog restart
cp /vagrant/docker /etc/logrotate.d/
cp /etc/cron.daily/logrotate /etc/cron.hourly


# configure hosts file for our internal network defined by Vagrantfile
# FIX THIS TO BE DYNAMIC

cat >> /etc/hosts <<EOL

# vagrant environment nodes
`grep -i public_network Vagrantfile | grep -i mgmt | cut -d "," -f 2 | cut -d "\"" -f 2`  mgmt
`grep -i public_network Vagrantfile | grep -i dfsp1 | cut -d "," -f 2 | cut -d "\"" -f 2`  dfsp1
`grep -i public_network Vagrantfile | grep -i dfsp2 | cut -d "," -f 2 | cut -d "\"" -f 2`  dfsp2
`grep -i public_network Vagrantfile | grep -i ist | cut -d "," -f 2 | cut -d "\"" -f 2`  ist
EOL

