# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do | config|
    config.vm.define "web", primary: true do | web|
      web.vm.box = "puppetlabs/ubuntu-14.04-32-nocm"
      web.vm.network "forwarded_port", guest:80, host:8888
      #web.vm.synced_folder "vagrantsite/", "/opt/vagrantsite" 
      web.vm.synced_folder "html/", "/opt/html", type: "rsync"
      web.vm.provision "shell", inline: "apt update; apt-get install -y nginx; mv /usr/share/nginx/html /usr/share/nginx/html.bk;ln -s /opt/html /usr/share/nginx/html"
        web.vm.provider "virtualbox" do |vbox|
        vbox.memory = 512
        vbox.cpus = 1 
     end
  end  
end    
          
