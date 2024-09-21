###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "web_vm_settings" {
  type = object({
    platform_id   = string,
    core_count    = number,
    core_fraction = number,
    memory_count  = number,
    hdd_size      = number,
    hdd_type      = string,
    preemptible   = bool,
    nat           = bool
  })
  default = {
    core_count    = 2,
    core_fraction = 5,
    memory_count  = 1,
    hdd_size      = 5,
    hdd_type      = "network-hdd",
    platform_id   = "standard-v1",
    preemptible   = true,
    nat           = true
  }
}



variable "each_vm" {
  type = list(object({cores = number, name = string, memory=number, core_fraction=number, preemptible   = bool, platform_id = string}))
  default = [{name = "main", cores= 2, memory=2, core_fraction=5, preemptible   = true, platform_id   = "standard-v1"}, {name = "replica", cores= 2, memory= 1, core_fraction=5, preemptible   = true, platform_id   = "standard-v1"}]  
}