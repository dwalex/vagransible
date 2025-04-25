Vagrant.require_version ">= 1.8.0"

Vagrant.configure(2) do |config|
  config.vm.box_check_update = false
  config.vm.define "smallbox" do |smallbox|  
    smallbox.vm.box = "hashicorp/bionic64"
    smallbox.vm.box_version = "1.0.282"
    smallbox.vm.hostname = "smallbox.local"
    smallbox.vm.network "private_network", ip: "192.168.56.10", hostname: true
    smallbox.vm.synced_folder ".", "/vagrant", disabled: true
    smallbox.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = "2"
      vb.gui = false
      vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
    end
  end
  config.vm.define "tinybox" do |tinybox|
    tinybox.vm.box = "alpine-linux/alpine-x86_64"
    tinybox.vm.box_version = "3.12.0"
    tinybox.vm.hostname = "tinybox.local"
    tinybox.vm.network "private_network", ip: "192.168.56.11", hostname: true
    tinybox.vm.synced_folder ".", "/vagrant", disabled: true
    tinybox.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = "1"
    end
  end
end
