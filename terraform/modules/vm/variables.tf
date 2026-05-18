variable "vm_name" {
  type        = string
  description = "Nom de la VM dans Proxmox"
}

variable "memory" {
  type        = number
  description = "RAM en MB"
  default     = 2048
}


variable "cores" {
  type        = number
  description = "Nombre de cœurs CPU"
  default     = 1
}

variable "disk_size" {
  type        = number
  description = "Taille du disque en GB"
  default     = 20
}

variable "ci_user" {
  type = string
}

variable "ci_password" {
  type      = string
  sensitive = true
}

variable "ssh_public_key" {
  type = string
}


variable "ip_address" {
  type        = string
  description = "Adresse IP statique de la VM (ex: 192.168.126.141)"
}

variable "gateway" {
  type        = string
  description = "Passerelle par défaut"
  default     = "192.168.126.1"
}

variable "dns" {
  type        = string
  description = "Serveur DNS"
  default     = "8.8.8.8"
}