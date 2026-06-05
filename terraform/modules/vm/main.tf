resource "proxmox_vm_qemu" "vm" {
  # Identité
  name        = var.vm_name
  target_node = "monlab"
  vmid        = var.vmid

  # Template source (clone)
  clone       = "AlmaLinux-Gold-Template"

  # Ressources
  cores       = var.cores
  memory      = var.memory
  vm_state    = "running"
  agent   = 1
  # Cloud-init
  os_type     = "cloud-init"
  ipconfig0   = "ip=${var.ip_address}/24,gw=${var.gateway}"
  ciuser      = var.ci_user
  cipassword  = var.ci_password
  sshkeys     = var.ssh_public_key

  # Disque
  scsihw = "virtio-scsi-pci"
  disks {
    scsi {
      scsi0 {
        disk {
          size    = var.disk_size
          storage = "dataStore"
          format  = "raw"
        }
      }
    }
  }
  cloudinit_cdrom_storage = "dataStore"

  # Réseau
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
}