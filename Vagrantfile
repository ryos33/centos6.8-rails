Vagrant.configure(2) do |config|

  box_name = "bento/centos-6.8"
  host_name = "centos-6-8-rails"
  memory = 4096
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
  ruby_ver = '2.5.0'
  rbenv_dir = '/opt/rbenv'
  rails_ver = '5.1.4'

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
#  config.vm.provision "shell-pubkey", type: "shell", path: "./provision-script/pubkey.sh", privileged: true
  config.vm.provision "shell-kernel", type: "shell", path: "./provision-script/kernel.sh", privileged: true
#  config.vm.provision "shell-gui", type: "shell", path: "./provision-script/gui.sh", privileged: true
  config.vm.provision "shell-rbenv", type: "shell", path: "./provision-script/rbenv.sh", privileged: true, args: [ruby_ver, rbenv_dir]
  config.vm.provision "shell-rails", type: "shell", path: "./provision-script/rails.sh", privileged: true, args: [rails_ver]

end
