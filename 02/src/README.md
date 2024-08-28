Задание 1

1.В файле variables.tf определены типы переменных и некоторые дефолтные значения.

2.
eugene@Ubuntu22LTS:~$ ls -a .authorized_key.json 
.authorized_key.json

3. ssh-keygen -t ed25519


4.
а)Закоментировал переменную token, т.к используется метод "service_account_key_file = file("~/.authorized_key.json")"

#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

б)Указал корретный family main.tf:

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



