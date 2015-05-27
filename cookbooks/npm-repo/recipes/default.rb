

  # Since Vagrant on an NTFS host doesn't support symlinks properly,
  # We decided to move the node_modules directory off the shared disk.
  directory "/vagrant/app/node_modules" do
      recursive true
      action :delete
      not_if "test -L /vagrant/app/node_modules"
      only_if { node['vagrant']['symlink_npm'] }
  end
  
  directory "/tmp/node_modules" do
      owner "vagrant"
      group "vagrant"
      only_if { node['vagrant']['symlink_npm'] }
  end
  
  link "/vagrant/app/node_modules" do
      owner "vagrant"
      group "vagrant"
      to "/tmp/node_modules"
      only_if { node['vagrant']['symlink_npm'] }
  end