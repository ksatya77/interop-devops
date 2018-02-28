# devops

Repo for devops, for various scenarios of deploying L1P system, currently in a local setting.

Supported configurations:

Vargrant - Local install - [click here](README_VAGRANT.md):

  Supported Platforms
    - Mac (Tested on Yosimite, Sierra, and High Sierra)
    - Linux (Tested on Ubuntu 14.04 and 16.04)
    - Windows (not supported at this time due to specific shell scripting requirements)

  Prequisites and requirements:
    - HOST OS requirements RAM: minimum 8gb RAM, 12gb RAM required for all components, 16gb RAM recommemded
                      DISK: TBD (Github repo, VM creation, etc.)

    - Prerequisites:
         Vagrant (Version TBD)
         VirtualBox (version tbd)
         Boto?

Cloud - Remote install - [click here](README_EC2.md) :
  - AWS - Native support and can be run end-to-end via the interop-devops install
  - Azure - Manual install can be performed (requires ssh access to the host with sudo capabilities)

    - AWS requirements:
        Security
        Network/ports
        AMIs
        Keys

    - Prerequisites:
        Ansible (version TBD...assuming 2.4 minimum based on the functions utilized)
        Boto?
