# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_API_VERSION = 2
RAM = 1024

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(VAGRANT_API_VERSION) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.define 'centos', primary: true do |centos|
    centos.vm.box = 'centos/7'
  end

  config.vm.define 'debian', autostart: false do |debian|
    debian.vm.box = 'debian/jessie64'
  end

  config.vm.define 'ubuntu', autostart: false do |ubuntu|
    ubuntu.vm.box = 'ubuntu/trusty64'
  end

  config.vm.define 'fedora', autostart: false do |fedora|
    fedora.vm.box = 'fedora/28-cloud-base'
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder 'promises/',
                          '/var/cfengine/inputs/services/',
                          type:  'rsync',
                          owner: 'root',
                          group: 'root',
                          mount_options: ['dmode=755,fmode=600']

  config.vm.synced_folder 'custom/promises/',
                          '/var/cfengine/inputs/services/custom/',
                          type:  'rsync',
                          owner: 'root',
                          group: 'root',
                          mount_options: ['dmode=755,fmode=600']

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:

  config.vm.provider 'virtualbox' do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = RAM
  end

  config.vm.provider 'libvirt' do |lv|
    lv.memory = RAM
  end
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

  config.vm.provision 'shell', inline: <<-SHELL
    cd /vagrant
    sudo ./pinocchio.sh setup
  SHELL
end
