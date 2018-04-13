# devops

Repo for devops, for various scenarios of deploying L1P system, currently in a local setting.

Vagrant setup using ansible playbooks to create two dfsp and one switch VMs with support for mgmt VMs to allow execution on all supported platforms, including windows.

Contents:

- [Deployment](#deployment)
- [Configuration](#configuration)
- [API](#api)
- [Logging](#logging)
- [Tests](#tests)

## Deployment

Steps for building:

Pre-requisites:

1.  SSH client and the correct ssh public key
2.  Required software packages:  ansible,
3.  Install the boto library. `sudo pip install boto`
4.  AWS credential and config information

Installation:

Amazon EC2 environment  (For the installation instructions to the Local L1P environment [click here](README.md))

1.  Unpack the devops image into a directory of your choice (base directory)
2.  Create a .aws sub-directory in your home directory and copy the AWS config and credential files there.  If you do not have these but only the key id and secret key id, the awscli can be installed and run to configure and create these files
3.  Execute the command `ansible-playbook create-ec2.yml -e "env=<env name>"`

Optional setup (Advanced):  The above command, without any modifiers, will install 1 Management node, 2 Financial Service Provider nodes, and 1 Central Services node with all components on each node.
You can modify this setup via the use of tags within the Vagrantfile by editing the ansible provisioning command near the end of the file.
The following tags are currently available:
eip - Used to control the binding of elastic ips at instance creation
provision - Creation of hoat machines nodes (MGMT, DFSP and SWITCH)
provision2 - Provisioning of the software requirements
auth - Used to cache authorization credentials for docker login to AWS ECR and jfrog repositories
mgmt - Pre-requsite software provisioning for the management node
switch - Installation of the Central Services components supplied by Dwolla
switch_db - Used to control the creation of db users and objects (should be skipped after initial creation)
mule_switch - Installation of the Central Services components supplied by ModusBox
dfsp - Installation of the Digital Service Provider parts supplied by Software Group
mule - Installation of the Digital Service Provider parts supplied by ModusBox
request - Creation of sample user data aka Bob and Alice
ilp - Installation of the Digital Service Provider parts supplied by Ripple
elk - Install of the ELK stack on the management node
filebeat - Installation of filebeat which is used to move data into the ELK stack
curator - Installation of the curator package which is used to manage index data for the ELK stack
cleanup - Used to control the cleanup of the locally created artifact files from the installation process

Example: `ansible-playbook create-ec2.yml -e "ec2-test" --skip-tags="provision, provision2, mgmt, dfsp, switch_db, mule, mule_switch, request, ilp, elk, filebeat, curator"` This command will only reinstall the switch software components without trying to reinstall the db users/objects.  All other roles will be skipped.

Notes:  

This has been tested on various Linux distros and OSX (currently windows is not supported due to .sh execution requirements)

Usage:

mgmt1-<name_tag> - The management console containing ELK and other mangement items.
dfsp1-<name_tag> - dfsp worker node
dfsp2-<name_tag> - dfsp worker node
switch1-<name_tag> - switch worker node

## Configuration

The -e option with the ansible-playbook command can be utilized to override any default variable.  The commonly used environment variables can be found in <base_dir>/group_vars/all/main.yml.
Example:  -e "ec2_region=us-east-2 name_tag=fake-demo" can be used to direct the actions to the us-east-2 zone with a naming convention of fake-demo.

## API

This repo does not contain an API.

## Logging

There are no logs of any operational value here, only for debugging purposes.

Debug logging has been consolidated to the mgmt VM and are located in /var/log/DockerRemote.log using rsyslog.

## Tests

There are no tests for this project.

