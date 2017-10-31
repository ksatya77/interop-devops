# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!

Vagrant.configure("2") do |config|

  config.vm.define :dfsp1 do |dfsp1_config|
    dfsp1_config.vm.box = "ubuntu/trusty64"
    dfsp1_config.vm.hostname = "dfsp1"
    ######### Update the line below to match your network settings ###########
    dfsp1_config.vm.network "public_network", ip: "192.168.0.xxx", bridge: "en0: Wi-Fi (AirPort)"
    #dfsp1_config.vm.network "private_network", ip: "10.0.15.11"
    dfsp1_config.vm.provider "virtualbox" do |v|
      v.memory = 2560
      v.cpus = 2
    end
  end

  config.vm.define :dfsp2 do |dfsp2_config|
    dfsp2_config.vm.box = "ubuntu/trusty64"
    dfsp2_config.vm.hostname = "dfsp2"
    ######### Update the line below to match your network settings ###########
    dfsp2_config.vm.network "public_network", ip: "192.168.0.xxx", bridge: "en0: Wi-Fi (AirPort)"
    #dfsp2_config.vm.network "private_network", ip: "10.0.15.12"
    dfsp2_config.vm.provider "virtualbox" do |v|
      v.memory = 2560
      v.cpus = 2
    end
  end

  config.vm.define :cst do |cst_config|
    cst_config.vm.box = "ubuntu/trusty64"
    cst_config.vm.hostname = "cst"
    ######### Update the line below to match your network settings ###########
    cst_config.vm.network "public_network", ip: "192.168.0.xxx", bridge: "en0: Wi-Fi (AirPort)"
    #cst_config.vm.network "private_network", ip: "10.0.15.13"
    cst_config.vm.provider "virtualbox" do |v|
      v.memory = 1536
      v.cpus = 1
    end
  end

  config.vm.define :mgmt do |mgmt_config|
    mgmt_config.vm.box = "ubuntu/trusty64"
    mgmt_config.vm.hostname = "mgmt"
    ######### Update the line below to match your network settings ###########
    mgmt_config.vm.network "public_network", ip: "192.168.0.xxx", bridge: "en0: Wi-Fi (AirPort)"
    #mgmt_config.vm.network "private_network", ip: "10.0.15.10"
    mgmt_config.vm.provider "virtualbox" do |v|
      v.memory = 3584 #increase to 3584 to accommodate ELK and Filebeat
      v.cpus = 1
    end

    mgmt_config.vm.provision :shell, path: "provision-mgmt.sh", privileged: false
    mgmt_config.vm.provision :shell, inline: "ansible-playbook -i /vagrant/inventory-file /vagrant/create-local.yml -e \"env=local\"", privileged: false
  end

end