Vagrant.configure("2") do |config|
	
  config.vm.box = "ubuntu/trusty64"

  config.vm.synced_folder "app/", "/home/vagrant/app"
  
  config.vm.network "forwarded_port", guest: 9099, host: 3000
  config.vm.provider "virtualbox" do |v|
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/app", "1"]
  end


  # Uncomment the following line to allow for symlinks
  # in the app folder. This will not work on Windows, and will
  # not work with Vagrant providers other than VirtualBox


  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "npm-repo"
    # chef.add_recipe "nodejs"
    # chef.add_recipe "mongodb-debs"
    # chef.add_recipe "redis-server"
    chef.json = {
  #    "nodejs" => {
  #      "version" => "0.10.29"
        # uncomment the following line to force
  # recent versions (> 0.8.5) to be built from
  # the source code
  # , "from_source" => true
  #    },
     "vagrant" => {
       "symlink_npm" => (RbConfig::CONFIG['host_os'] =~ /cygwin|mswin|mingw/) ? true : false
     }
    }
  end

  config.vm.provision :shell, :inline => "curl -sL https://deb.nodesource.com/setup | sudo bash -"
  #config.vm.provision :shell, :inline => "sudo apt-get update"
  config.vm.provision :shell, :inline => "sudo apt-get install -y build-essential --no-install-recommends"
  #config.vm.provision :shell, :inline => "sudo apt-get install -y redis-server --no-install-recommends"
  #config.vm.provision :shell, :inline => "sudo apt-get install -y ruby1.9.1-dev --no-install-recommends"
  #config.vm.provision :shell, :inline => "sudo apt-get install -y ruby1.9.3 --no-install-recommends"
  #config.vm.provision :shell, :inline => "sudo gem install cf"
  #config.vm.provision :shell, :inline => "sudo apt-get install nodejs"
  config.vm.provision :shell, :inline => "sudo rm -r /usr/local/bin/node /usr/local/bin/node-waf /usr/local/bin/npm"
  config.vm.provision :shell, :inline => "curl -L -O http://nodejs.org/dist/v0.12.4/node-v0.12.4-linux-x64.tar.gz && sudo tar xvf node-v0.12.4-linux-x64.tar.gz -C /usr/local/bin && sudo ln -s /usr/local/bin/node-v0.12.4-linux-x64/bin/node /usr/local/bin/node && rm -r node-v0.12.4-linux-x64.tar.gz"
  config.vm.provision :shell, :inline => "sudo ln -s /usr/local/bin/node-v0.12.4-linux-x64/bin/npm /usr/local/bin/npm"
end
