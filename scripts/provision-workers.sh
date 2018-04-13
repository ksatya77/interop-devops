#!/usr/bin/env bash

ansible-playbook provision-workers.yml
ansible-playbook dfsp-playbook.yml
ansible-playbook switch-playbook.yml
ansible-playbook modusbox-playbook-dfsp.yml
sleep 2m
./requests/requests.sh
sleep 2m
ansible-playbook ilp-playbook.yml
