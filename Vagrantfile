# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "boxxu"

  config.vm.network :private_network, ip: "192.168.33.10"
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|

     chef.add_recipe "git"
     chef.add_recipe "emacs"
     chef.add_recipe "erlang"
     chef.add_recipe "mininet"

 end

end
