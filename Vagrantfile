# -*- mode: ruby -*-
# vi: set ft=ruby :

domain = 'sp.com'
#Master puppet server
Vagrant::Config.run do |config|
  config.vm.define :master do |master_config|
    master_config.vm.box = 'precise64'
    master_config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
    master_config.vm.host_name = "puppet.#{domain}"
    master_config.vm.network :hostonly, '172.16.32.10'
	master_config.vm.share_folder "modules", "/etc/puppet/modules", "/Users/marc/Sites/sp-puppet/modules"
	
    master_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'provision/manifests'
      puppet.module_path = 'provision/modules'
    end
  end
#Centos server
  config.vm.define :client1 do |client_config|
    client_config.vm.box = 'centos57'
    client_config.vm.box_url = 'http://yum.mnxsolutions.com/vagrant/centos57_64.box'
    client_config.vm.host_name = "client1.#{domain}"
    client_config.vm.network :hostonly, '172.16.32.11'

    client_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'provision/manifests'
      puppet.module_path = 'provision/modules'
    end
  end
#Ubuntu 12.04 server
  config.vm.define :client2 do |client_config|
    client_config.vm.box = 'precise64'
    client_config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
    client_config.vm.host_name = "client2.#{domain}"
    client_config.vm.network :hostonly, '172.16.32.12'
	client_config.vm.share_folder "modules", "/etc/puppet/modules", "/Users/marc/Sites/sp-puppet/modules"
	client_config.vm.share_folder "my_scripts", "/usr/local/bin", "/Users/marc/Sites/my_scripts"
        #This line changes resolv.conf 
        #config.vm.provision :shell, :inline => "grep '8.8.8.8' /etc/resolv.conf || echo 'nameserver 8.8.8.8' > /etc/resolv.conf"
    
    client_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = 'provision/manifests'
      puppet.module_path = 'provision/modules'
    end
  end
end
