#!/usr/bin/env bash

#sudo cp -f /vagrant/artifacts/hosts /etc/hosts

sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y upgrade ansible

# Create RSA key
# run ssh-keygen -t rsa
#rm -f /home/vagrant/.ssh/id_rsa
#cat /dev/zero | ssh-keygen -t rsa -q -N "" -f /home/vagrant/.ssh/id_rsa

# setup known hosts file
#ssh-keyscan mgmt dfsp1 dfsp2 switch >> /home/vagrant/.ssh/known_hosts

#force ssh initial passwd auth
#/usr/bin/sshpass -p vagrant ansible -i /vagrant/inventory-file all -m ping --ask-pass

#Send keys to hosts
#/usr/bin/sshpass -p vagrant ansible-playbook -i /vagrant/inventory-file  /vagrant/ssh-addkey.yml --ask-pass