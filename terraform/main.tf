module "vms" {
  source = "./modules/vm"

  for_each = var.Vms_ips

    vm_name        = each.key
    ip_address     = each.value.ip
    vmid           = each.value.vmid
    gateway        = var.gateway
    dns            = var.dns
    ci_user        = var.vm_user
    ci_password    = var.ci_password
    ssh_public_key = var.sshkeys
}

resource "local_file" "Inventory" {
  filename = "/home/automation/3tier-iac-proxmox-provider/ansible/inventory/terraform.ini"
  content  = <<-EOT
[Proxmox]
%{for nom, value in var.Vms_ips}
${nom} ansible_host=${value.ip}
%{endfor}
EOT
}


resource "null_resource" "ansible_sync" {
  # CRUCIAL : On attend que le fichier ET les VMs soient terminés
  depends_on = [local_file.Inventory, module.vms]
  provisioner "local-exec" {
    command = <<-EOT
      %{for nom, value in var.Vms_ips}
      ssh-keygen -R ${value.ip}
      %{endfor}
    EOT
  }

  provisioner "local-exec" {
  command = "sleep 90"
}
  provisioner "local-exec" {
    
    command = "cd /home/automation/3tier-iac-proxmox-provider/ansible && ansible-playbook -i inventory/terraform.ini playbook/site.yaml"
  }
}