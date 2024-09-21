
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "web" {
  count = 2

  depends_on = [ yandex_compute_instance.vm-for_each ]

  name        = "web-${count.index + 1}"
  platform_id = var.web_vm_settings.platform_id

  resources {
    core_fraction = var.web_vm_settings.core_fraction
    cores         = var.web_vm_settings.core_count
    memory        = var.web_vm_settings.memory_count
  }
  scheduling_policy {
    preemptible = var.web_vm_settings.preemptible
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.web_vm_settings.hdd_type
      size     = var.web_vm_settings.hdd_size
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat                = var.web_vm_settings.nat
  }

  allow_stopping_for_update = true

  metadata = {
  serial-port-enable = 1
  ssh-keys = "ubuntu:ssh-ed25519 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMN6eyZjx9yr2fdKQt2DU3kmnPdXYVZNZvrHeCleepG/ eugene@Ubuntu22LTS"
  }
}