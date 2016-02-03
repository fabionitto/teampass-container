# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "hashicorp/precise64"

 # config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true
 # config.vm.synced_folder ".", "/vagrant", type: "nfs" 


  # config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 443, host: 8443

  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.provision "docker" do |d|
		d.run "mysql",
			image: "mysql:5.6",
			args: "-e MYSQL_ROOT_PASSWORD=testpass -e MYSQL_DATABASE=teampass -e MYSQL_USER=teampass -e MYSQL_PASSWORD=Team!!!Pass"
    d.run "t1",
			image: "teampass/teampass",
			args: "--link mysql:mysql"
		d.run "haproxy",
			image: "haproxy:1.6",
			args: "-p 443:443 --link t1:t1 -v /vagrant/config/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro	-v /vagrant/certs:/etc/certs"
  end

end
