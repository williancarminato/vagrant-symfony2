# -*- mode: ruby -*-
# vi: set ft=ruby :

configurationFile = File.expand_path("../VSConfiguration", __FILE__)
load configurationFile

Vagrant.configure("2") do |config|
  config.vm.box = $box_configuration

  if $box_url_configuration.is_a? String
    config.vm.box_url = $box_url_configuration
  end

  config.vm.network :private_network, ip: $box_ip_configuration
  config.vm.network :forwarded_port, guest: 80, host: $box_hostport_configuration
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", $box_memory_configuration]
    v.customize ["modifyvm", :id, "--name", $box_name_configuration]
  end

  nfs_setting = RUBY_PLATFORM =~ /darwin/ || RUBY_PLATFORM =~ /linux/
  config.vm.synced_folder "./", "/var/www", id: "vagrant-root" , :nfs => nfs_setting

  config.vm.provision :shell, :inline => "sudo apt-get update"
  config.vm.provision :shell, :inline => 'echo -e "mysql_root_password=123456
controluser_password=awesome" > /etc/phpmyadmin.facts;'

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.options = ['--verbose']
  end

  if $get_symfony == "yes"
    config.vm.provision :shell do |s|
      s.path = "files/symfony.sh"
      s.args = "#$symfony_path_configuration #$symfony_version_configuration"
    end
  end
end
