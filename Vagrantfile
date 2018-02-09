Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-6.8"
  config.vm.hostname = "centos-rails"
  config.vm.network "private_network", ip: "192.168.33.109"
  config.ssh.forward_agent = true
  config.vm.synced_folder "./data", "/data", owner: "vagrant", group: "vagrant"
  config.ssh.private_key_path = "key/id.key"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "centos-6.8-rails"
    vb.memory = "4096"
    vb.cpus = 2

    vb.gui = true
    vb.customize [
      "modifyvm", :id,
      "--vram", "256",
      "--clipboard", "bidirectional",
      "--draganddrop", "bidirectional",
      "--accelerate3d", "on",
      "--hwvirtex", "on",
      "--nestedpaging", "on",
      "--largepages", "on",
      "--ioapic", "on",
      "--pae", "on",
      "--paravirtprovider", "kvm",
    ]
  end

  config.vm.provision "shell-basic-setting", type: "shell", path: "./provision-script/basic-setting.sh", privileged: true
  config.vm.provision "shell-pubkey", type: "shell", path: "./provision-script/pubkey.sh", privileged: true
  config.vm.provision "shell-gui", type: "shell", path: "./provision-script/gui.sh", privileged: true
  config.vm.provision "shell-rails", type: "shell", path: "./provision-script/rails.sh", privileged: true

end
