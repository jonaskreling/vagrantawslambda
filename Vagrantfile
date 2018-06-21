###############################
# Supero Tecnologia - 06/2018 #
###############################

# Vagrantfile API/syntax version
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	# VirtualBox - Base [Usando Ubuntu LTS]
	config.vm.box = "bento/ubuntu-18.04"
	
	# Mapeamento da pasta de arquivos
	config.vm.synced_folder "../", "/home/vagrant"
	
	# Acesso ip estático
	config.vm.network "private_network", ip: "192.168.10.10"
	config.vm.network "forwarded_port", guest: 3000, host: 80, protocol: "tcp", auto_correct: true
	
	# Scripts de instalacao
	config.vm.provision :shell, :path => "scripts/install.sh"
  
end