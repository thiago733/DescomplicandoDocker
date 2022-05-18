output "proxmox_ip_address_manager" {
  description = "Current IP Manager"
  value       = proxmox_vm_qemu.docker_manager.*.default_ipv4_address
}
output "proxmox_ip_address_worker1" {
  description = "Current IP Worker1"
  value       = proxmox_vm_qemu.docker_worker1.*.default_ipv4_address
}
output "proxmox_ip_address_worker2" {
  description = "Current IP Worker2"
  value       = proxmox_vm_qemu.docker_worker2.*.default_ipv4_address
}
output "proxmox_ip_address_worker3" {
  description = "Current IP Worker3"
  value       = proxmox_vm_qemu.docker_worker3.*.default_ipv4_address
}