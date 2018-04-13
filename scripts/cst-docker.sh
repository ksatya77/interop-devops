#!/usr/bin/env bash

# Create RSA key
# run ssh-keygen -t rsa
cat /dev/zero | ssh-keygen -t rsa -q -N "" -f /home/vagrant/.ssh/id_rsa

# setup known hosts file
ssh-keyscan dfsp1 dfsp2 switch >> /home/vagrant/.ssh/known_hosts

# copy configs into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/* /home/vagrant
mkdir /home/vagrant/.aws
cp -a /vagrant/.aws/* /home/vagrant/.aws
#chown -R vagrant:vagrant /home/vagrant

#force ssh initial passwd auth
/usr/bin/sshpass -p vagrant ansible all -m ping --ask-pass

#Send keys to hosts
ansible-playbook ssh-addkey.yml