$script_apache = <<-SCRIPT
apt-get update
apt-get -y install apache2
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"

  config.vm.define "apache" do |apache|

    apache.vm.network "forwarded_port", guest: 80, host: 8081
    apache.vm.network "public_network"

    apache.vm.synced_folder ".", "/vagrant", disabled: true
    apache.vm.synced_folder "./apache", "/vagrant"

    apache.vm.provision "shell", inline: $script_apache
    apache.vm.provision "shell", inline: "cat /vagrant/id_rsa.pub >> .ssh/authorized_keys"
  end

  config.vm.define "mysql" do |mysql|
    mysql.vm.hostname = "mysqldb"
    mysql.vm.synced_folder ".", "/vagrant", disabled: true
    mysql.vm.synced_folder "./mysql", "/vagrant"
  end

end
