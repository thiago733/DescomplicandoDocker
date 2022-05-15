terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.10"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://proxmox:8006/api2/json"
  pm_api_token_id = "root@pam!terraform"
  pm_api_token_secret = "5fe3ef0b-8002-439b-85b6-33e8ea4d0f5d"
  pm_tls_insecure = true
}
resource "proxmox_vm_qemu" "docker_server" {
  os_type = "ubuntu"
  count = 1 
  name = "docker-${count.index + 1}" 
  target_node = var.proxmox_host
  iso = var.iso
  memory = 2048
  cores = 2
  bios = "ovmf"
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  agent = 1

disk {
  slot = 0
  size = "10G"
  type = "scsi"
  storage = "local-lvm"
  iothread = 1
}
  
network {
  model = "virtio"
  bridge = "vmbr0"
}  
  
}
