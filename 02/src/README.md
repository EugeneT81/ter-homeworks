Задание 1

1.В файле variables.tf определены типы переменных и некоторые дефолтные значения.

2.eugene@Ubuntu22LTS:~$ ls -a .authorized_key.json 
.authorized_key.json

3. ssh-keygen -t ed25519


4.а)Закоментировал переменную token, т.к используется метод "service_account_key_file = file("~/.authorized_key.json")"


б)Указал корректный family main.tf:

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts-oslogin"
}

в)platform_id = "standard" и сores = 2
resource "yandex_compute_instance" "platform" {
  name        = "netology-develop-platform-web"
  platform_id = "standard"
  resources {
    cores         = 2

5.

![alt text](curl.png)


![alt text](VM2.png)


![alt text](VM.png)



preemptible = true

Прерываемые виртуальные машины — это виртуальные машины, которые могут быть принудительно остановлены в любой момент.

https://yandex.cloud/ru/docs/compute/concepts/preemptible-vm


core_fraction=5

Базовый уровень производительности vCPU.

https://yandex.cloud/ru/docs/compute/concepts/performance-levels



Задание 2

main.tf:


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  name        = var.vm_web_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
  }




  variables.tf:


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



![alt text](<ter app no change.png>)


Задание 3






