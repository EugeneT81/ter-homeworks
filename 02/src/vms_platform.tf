variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts-oslogin"
  description = "ubuntu image"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "vm name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "vm id"
}

variable "vm_web_cores" {
  type        = string
  default     = "2"
  description = "vCPU numbers"
}

variable "vm_web_memory" {
  type        = string
  default     = "1"
  description = "RAM"
}

variable "vm_web_core_fraction" {
  type        = string
  default     = "5"
  description = "vCPU core_fraction"
}


variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts-oslogin"
  description = "ubuntu image"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "vm name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "vm id"
}

#variable "vm_db_cores" {
#  type        = string
#  default     = "2"
#  description = "vCPU numbers"
#}

#variable "vm_db_memory" {
#  type        = string
#  default     = "2"
#  description = "RAM"
#}

#variable "vm_db_core_fraction" {
#  type        = string
#  default     = "20"
#  description = "vCPU core_fraction"
#}

variable "vms_resources" {
  type = map(map(number))
  default = {
    vm_web_resources = {
      vm_web_core_fraction = 5
      vm_web_cores         = 2
      vm_web_memory        = 1
    }
    vm_db_resources = {
      vm_db_core_fraction = 20
      vm_db_cores         = 2
      vm_db_memory        = 2
    }
  }
  description = "vms_resources"
}