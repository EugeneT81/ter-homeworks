resource "yandex_compute_disk" "for_storage" {
  count   = 3
  name  = "disk-${count.index + 1}"
  size  = 1
}


resource "yandex_compute_instance" "storage" {
  name = "storage"
  resources {
    cores = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
    image_id = data.yandex_compute_image.ubuntu.image_id
        }
  }

  dynamic "secondary_disk" {
   for_each = yandex_compute_disk.for_storage.*.id
   content {
     disk_id = secondary_disk.value
   }
  }
  network_interface {
     subnet_id = yandex_vpc_subnet.develop.id
     nat     = true
  }

 metadata = local.ssh_keys_and_serial_port 
}