# devops

Repo for devops, for various scenarios of deploying L1P system, currently in a local setting.

Vagrant setup using ansible playbooks to create two dfsp and one ist VMs with support for mgmt VMs to allow execution on all supported platforms, including windows.

Contents:

- [Deployment](#deployment)
- [Configuration](#configuration)
- [API](#api)
- [Logging](#logging)
- [Tests](#tests)

## Deployment

Steps for building:

Pre-requisites:

1.  Vagrant
2.  VirtualBox
3.  An ssh client (Git for Windows can be used to get a full ssh client)
4.  AWS credential and config information (only for AWS installs)

Installation:

Local L1P install (For the installation instructions to the Amazon EC2 environment [click here](README_EC2.md))

1.  Unpack the interop-devops image into a directory of your choice (base directory)
    GitHub url: https://github.com/mojaloop/interop-devops
    Options for how to obtain the image:
    1.  Create and download the zipped image from the above url.  Click the `Clone or download` dropdown button and then click `Download Zip`.
    2.  Clone the image locally: `git clone https://github.com/mojaloop/interop-devops.git`
    3.  Use GitHub Desktop to pull the image from the above url.  Click the `Clone or download` dropdown button and then click `Open in Desktop`.
2.  Create a .aws sub-directory in your home directory and copy the AWS config and credential files there.  If you do not have these but only the key id and secret key id, the awscli can be installed and run to configure and create these files
3.  Test that you have a working ssh client in the path.
4.  Configure the network parameters in the Vagrantfile:
    Choose Public (accessible allowable address on the same network) or Private (creates a VPN on you machine and is only accessible from that host without a proxy)
    Public Networking Option:
    1.  Open <base_dir>/Vagrantfile in the editor of your choice.
    2.  Locate the four locations which require configuration, for example:
        ```
        ######### Update the line below to match your network settings ###########
        dfsp1_config.vm.network "public_network", ip: "192.168.0.xxx", bridge: "en0: Wi-Fi (AirPort)"
        ```
    3.  Update the ip: entry and bridge: entry to match the settings for the host machine running this image.
        Note:  The command `/usr/local/bin/VBoxManage list bridgedifs` can be used to help find the name of the network and ip address this machine uses on that network.  Update the ip entries with four unused ip addresses on that network.
    Private Networking Option:
    1.  Open <base_dir>/Vagrantfile in the editor of your choice.
    2.  Comment out the four lines from the public example and uncomment the four lines for private_network, for example:
        ```
        #dfsp1_config.vm.network "public_network", ip: "192.168.0.xxx", bridge: "en0: Wi-Fi (AirPort)"
        dfsp1_config.vm.network "private_network", ip: "10.0.15.11"
        ```
    3.  Open <base_dir>/group_vars/all/main.xml in the editor of your choice.
    4.  Switch the vagrant_net_type entry like below to set the private networking option:
        ```
        # Vagrantfile network setup (for local install only)
        vagrant_net_type: private_network #public_network or private_network
        ```
5.  Run the command 'vagrant up' from the base directory

Optional setup (Advanced):  The above command, without any modifiers, will install 1 Management node, 2 Financial Service Provider nodes, and 1 Central Services node with all components on each node.
You can modify this setup via the use of tags within the Vagrantfile by editing the ansible provisioning command near the end of the file or by executing ansible-playbook on the command line.
Example: `ansible-playbook create-local.yml -e "local" --skip-tags="provision, provision2, mgmt, ist, ist_db, mule_ist, request, elk, filebeat, curator"` This command will reinstall the dfsp, mule and ilp software components.  All other roles will be skipped.

The following tags are currently available:
provision - Creation of hoat machines nodes (MGMT, DFSP and IST)
provision2 - Provisioning of the software requirements
auth - Used to cache authorization credentials for docker login to AWS ECR and jfrog repositories
mgmt - Pre-requsite software provisioning for the management node
ist - Installation of the Central Services components supplied by Dwolla
ist_db - Used to control the creation of db users and objects (should be skipped after initial creation)
mule_ist - Installation of the Central Services components supplied by ModusBox
dfsp - Installation of the Digital Service Provider parts supplied by Software Group
mule - Installation of the Digital Service Provider parts supplied by ModusBox
request - Creation of sample user data aka Bob and Alice
ilp - Installation of the Digital Service Provider parts supplied by Ripple
elk - Install of the ELK stack on the management node
filebeat - Installation of filebeat which is used to move data into the ELK stack
curator - Installation of the curator package which is used to manage index data for the ELK stack
cleanup - Used to control the cleanup of the locally created artifact files from the installation process

Notes:  

This has been tested on various Linux distros and OSX (currently windows is not supported due to .sh execution requirements)

Usage:

Once the vagrant environment has been started, you should be able to connect to any of the running boxes via vagrant ssh.  As of writing this we have the following boxes:

mgmt - The management console used to run ansible commands and playbooks out to the worker nodes.
dfsp1 - dfsp worker node
dfsp2 - dfsp worker node
ist - ist worker node

example:  vagrant ssh mgmt

Optional modules available:
- Filebeat:  Intended to be installed on the mgmt node to ship logs to the ELK stack of your choice.  Edit the filebeat.yml and update the ip-address entries to point to the host running ELK.
  usage: Currently, this modules have been commented out in the create-local.yml ansible playbook to reduce the memory footprint.

- ELK:  A all in one ELK container which can be run on an OS you choose.  Requires a memory map increase to allow Elasticsearch to start.
  usage: Currently, this modules have been commented out in the create-local.yml ansible playbook to reduce the memory footprint.

- Curator:  Used to managed indexes in Elasticsearch for memory and disk space management.
  usage: Currently, this modules have been commented out in the create-local.yml ansible playbook to reduce the memory footprint.

The section [in this video](https://www.dropbox.com/home/Level%20One%20OSS%20Team%20Share/Phase%20One%20Wrap-up/Demo%20Folder?preview=ModusBox+Demo.mp4) starting at 00:10 and ending at 8:43 provides a brief overview of the Usage and the components involved.

## Configuration

Changes required for Windows 10:

VirtualBox and Hyper-V conflict and cause a blue screen crash.  For this reason and other intricacies of Hyper-V, it is best to disable Hyper-V and use Virtual Box.

## API

This repo does not contain an API.

## Logging

There are no logs of any operational value here, only for debugging purposes.

Debug logging has been consolidated to the mgmt VM and are located in /var/log/DockerRemote.log using rsyslog.

## Tests

There are no tests for this project.

There are no tests for this project.
