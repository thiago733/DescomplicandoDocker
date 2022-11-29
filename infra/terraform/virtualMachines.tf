provider "proxmox" {
  pm_api_url          = "https://proxmox:8006/api2/json"
  pm_api_token_id     = "root@pam!terraform"
  pm_api_token_secret = "8f70c2d4-c302-4047-9f74-04828a8f0195"
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "docker_manager" {
  clone       = "UbuntuServer22.04"
  os_type     = "ubuntu"
  count       = 1 #count = 1 # just want 1 for now, set to 0 and apply to destroy VM
  name        = "dockerManager" #name = "test-vm-${count.index + 1}" #count.index starts at 0, so + 1 means this VM will be named test-vm-1 in proxmox
  target_node = var.proxmox_host
  memory      = 4096
  cores       = 4
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  agent       = 1
  disk {
    slot    = 0
    size    = "32G"
    type    = "scsi"
    storage = "local-btrfs"
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
}

resource "proxmox_vm_qemu" "docker_worker1" {
  clone       = "UbuntuServer22.04"
  os_type     = "ubuntu"
  name        = "dockerWorker1"
  target_node = var.proxmox_host
  memory      = 2048
  cores       = 2
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  agent       = 1
  disk {
    slot    = 0
    size    = "32G"
    type    = "scsi"
    storage = "local-btrfs"
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
}

resource "proxmox_vm_qemu" "docker_worker2" {
  clone       = "UbuntuServer22.04"
  os_type     = "ubuntu"
  name        = "dockerWorker2"
  target_node = var.proxmox_host
  memory      = 2048
  cores       = 2
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  agent       = 1
  disk {
    slot    = 0
    size    = "32G"
    type    = "scsi"
    storage = "local-btrfs"
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
}

resource "proxmox_vm_qemu" "docker_worker3" {
  clone       = "UbuntuServer22.04"
  os_type     = "ubuntu"
  name        = "dockerWorker3"
  target_node = var.proxmox_host
  memory      = 2048
  cores       = 2
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  agent       = 1
  disk {
    slot    = 0
    size    = "32G"
    type    = "scsi"
    storage = "local-btrfs"
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
}