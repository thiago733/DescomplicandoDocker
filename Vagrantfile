Vagrant.configure("2") do |config|
    (1..3).each do |i|
      config.vm.define "docker0#{i}" do |docker|
        docker.vm.box = "ubuntu/focal64"
        docker.vm.network "public_network", bridge: "wlp2s0", ip:"192.168.15.11#{i}"
        docker.vm.hostname = "docker0#{i}"
        docker.vm.provision "shell",  path: "atualizaSistemaOperacionalViaApt.sh"
      config.vm.provider "virtualbox" do |v|
        v.memory = 4196
        v.cpus = 4
      end
    end
  end
end