###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "cloud_id" {
  type        = string
  default = "b1g2rlcme57nmrfvfker"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1glatp639he3a6n054t"
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
  description = "VPC network & subnet name"
}


variable "db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}


variable "vpc_db_name" {
  type        = string
  default     = "database"
  description = "DB VPC network & subnet name"
}

variable "db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}  
###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMN6eyZjx9yr2fdKQt2DU3kmnPdXYVZNZvrHeCleepG/ eugene@Ubuntu22LTS"
#  description = "ssh-keygen -t ed25519"
#}

variable "vms_metadata" {
  type = map(string)
  default = {
    "serial-port-enable" = "1"
    "ssh-keys"           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMN6eyZjx9yr2fdKQt2DU3kmnPdXYVZNZvrHeCleepG/ eugene@Ubuntu22LTS"
  }
  description = "ssh-keygen  vms_metadata"
}

variable "project" {  default = "netology-develop-platform"}
variable "vm_web" {  default = "web"}
variable "vm_db" {  default = "db"}



