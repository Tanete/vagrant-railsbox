# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "rails-dev"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder "../rails-project", "/vagrant_data"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1111"
  end
  config.vm.provision :shell, path: "bootstrap.sh", privileged: false
end
