variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type      = string
  sensitive = true # hide secret on terraform plan/apply
}


variable "vm_user" {

  type = string
  
}

variable "sshkeys" {
  type = string
  sensitive = true
}

variable "Vms_ips" {
  type = map(object({
    ip = string
    vmid = number
  }))
}

variable "dns" {
  type = string
}

variable "gateway" {
  type = string
}