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

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "chef/centos-7.0"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3030

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
  config.vm.synced_folder "./Code", "/usr/share/nginx/html"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
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
  config.vm.provision "shell", inline: <<-SHELL
    echo "# Empezamos
    " >> /vagrant/vagrant.log.mdown
    sudo yum update -y >> /vagrant/vagrant.log.mdown
    echo "# Actualizado
    " >> /vagrant/vagrant.log.mdown
    sudo yum install -y git vim >> /vagrant/vagrant.log.mdown
    echo "# Basic tools installed
    " >> /vagrant/vagrant.log.mdown
    sudo rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm >> /vagrant/vagrant.log.mdown
    sudo yum install -y nginx >> /vagrant/vagrant.log.mdown
    sudo systemctl start nginx.service >> /vagrant/vagrant.log.mdown
    sudo systemctl enable nginx.service >> /vagrant/vagrant.log.mdown
    echo "# Instalado NginX, comprueba que funciona visitando http://127.0.0.1:8080
    " >> /vagrant/vagrant.log.mdown
    sudo yum install -y mariadb-server mariadb >> /vagrant/vagrant.log.mdown
    sudo systemctl start mariadb >> /vagrant/vagrant.log.mdown
    echo "# Instalado MariaDB, recuerda ejecutar \"sudo mysql_secure_installation\" y \"sudo systemctl enable mariadb.service\"
    " >> /vagrant/vagrant.log.mdown
    gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    #curl -L https://get.rvm.io | bash -s stable
    # Aun no he conseguido que funcione
    #rvm group add rvm "$USER"
    #rvm install ruby >> /vagrant/vagrant.log.mdown
    #rvm use ruby --default 2.2.1
    #gem install rails >> /vagrant/vagrant.log.mdown
  SHELL
  config.vm.provision "shell", path: "install-rvm.sh",  args: "stable"
  config.vm.provision "shell", path: "install-ruby.sh", args: "ruby rails haml execjs therubyracer"
  config.vm.provision "shell", path: "wakeup-rails-project.sh", args: "blog"
end