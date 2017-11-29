#!/usr/bin/env bash

ansible-playbook create-ec2.yml -e "name_tag=performance-test keypair=interop-dev1 ec2_region=us-west-2" -t "auth, filebeat" --skip-tags="provision, dfsp, ist, ilp"
