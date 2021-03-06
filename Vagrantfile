Vagrant.configure(2) do |config|

  box_name = "bento/centos-6.8"
  host_name = "centos-6-8-rails"
  memory = 2048
  cpus = 2
  private_ip = "192.168.33.109"
  vboxsf_defs = [
    {
      host_dir: "./data",
      guest_dir: "/mnt/data",
      guest_owner: "vagrant",
      guest_group: "vagrant",
    }
  ]
  ruby_ver = '2.3.0'
  rbenv_dir = '/opt/rbenv'
  rails_ver = '5.1.4'
  node_ver = '7.10.1'
  ionic_ver = '2.1.17'
  cordova_ver = '4.3.1'
  samba_allow_network = '192.168.33.'

  config.vm.box = box_name
  config.vm.hostname = host_name
  config.vm.network "private_network", ip: private_ip
  config.ssh.forward_agent = true
  vboxsf_defs.each do |vboxsf_def|
    config.vm.synced_folder vboxsf_def[:host_dir], vboxsf_def[:guest_dir], owner: vboxsf_def[:guest_owner], group: vboxsf_def[:guest_group]
  end

#  config.ssh.private_key_path = "key/id.key"

  config.vbguest.auto_update = false

  config.vm.provider "virtualbox" do |vb|
    vb.name = host_name
    vb.memory = memory
    vb.cpus = cpus

#    vb.gui = true
#    vb.customize [
#      "modifyvm", :id,
#      "--vram", "256",
#      "--clipboard", "bidirectional",
#      "--draganddrop", "bidirectional",
#      "--accelerate3d", "on",
#      "--hwvirtex", "on",
#      "--nestedpaging", "on",
#      "--largepages", "on",
#      "--ioapic", "on",
#      "--pae", "on",
#      "--paravirtprovider", "kvm",
#    ]

  end

  config.vm.provision "shell-basic-setting", type: "shell", path: "./provision-script/basic-setting.sh", privileged: true
  config.vm.provision "shell-copy-vagrant-key", type: "shell", path: "./provision-script/copy-vagrant-key.sh", privileged: true
#  config.vm.provision "shell-pubkey", type: "shell", path: "./provision-script/pubkey.sh", privileged: true
  config.vm.provision "shell-kernel", type: "shell", path: "./provision-script/kernel.sh", privileged: true
#  config.vm.provision "shell-gui", type: "shell", path: "./provision-script/gui.sh", privileged: true
  config.vm.provision "shell-rbenv", type: "shell", path: "./provision-script/rbenv.sh", privileged: true, args: [ruby_ver, 'vagrant']
#  config.vm.provision "shell-rbenv", type: "shell", path: "./provision-script/rbenv.sh", privileged: true, args: [ruby_ver, 'ALL', rbenv_dir]
#  config.vm.provision "shell-rails", type: "shell", path: "./provision-script/rails.sh", privileged: true, args: [rails_ver, 'vagrant']
#  config.vm.provision "shell-rails", type: "shell", path: "./provision-script/rails.sh", privileged: true, args: [rails_ver, 'ALL']
  config.vm.provision "shell-npm", type: "shell", path: "./provision-script/npm.sh", privileged: true, args: [node_ver]
  config.vm.provision "shell-ionic", type: "shell", path: "./provision-script/ionic.sh", privileged: true, args: [ionic_ver, cordova_ver]
  config.vm.provision "shell-samba", type: "shell", path: "./provision-script/samba.sh", privileged: true, args: [samba_allow_network]

end
