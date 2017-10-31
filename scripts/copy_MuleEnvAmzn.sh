#! /usr/bin/env bash

ansible dfsp$1 -i ./hosts --ssh-extra-args='-i ../../../interop-dev1.pem -l ec2-user' -u ec2-user -m file -a "path=/opt/mule state=directory" --become
ansible dfsp$1 -i ./hosts --ssh-extra-args='-i ../../../interop-dev1.pem -l ec2-user' -u ec2-user -m file -a "path=/opt/mule/conf state=directory" --become
ansible dfsp$1 -i ./hosts --ssh-extra-args='-i ../../../interop-dev1.pem -l ec2-user' -u ec2-user -m copy -a "src=MuleEnv.properties.$1 dest=/opt/mule/conf/MuleEnv.properties" --become
