# -*- mode: ruby -*-
# vi: set ft=ruby :

$LOAD_PATH << './definitions/boxxu'
require 'boxxu_settings.rb'

Vagrant::Config.run do |config|
  
  config.vm.guest = :linux
  config.vm.box = "boxxu"
  
  config.vm.network :hostonly, BoxxuSettings::host_addr

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

   config.vm.provision :chef_solo do |chef|
     
     chef.node_name = "boxxu"
     chef.add_recipe "build-essential"
     chef.add_recipe "yum"
     chef.add_recipe "apt"
     chef.add_recipe "erlang"
     chef.add_recipe "mininet"
  end

end
