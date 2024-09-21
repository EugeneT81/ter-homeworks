resource "yandex_compute_instance" "vm-for_each" {
  
  
  for_each = {for vm, value in var.each_vm : vm => value}
  name = each.value ["name"]
  
  
  resources {
        cores           = each.value ["cores"]
        memory          = each.value ["memory"]
        core_fraction   = each.value ["core_fraction"]
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = local.ssh_keys_and_serial_port 
}