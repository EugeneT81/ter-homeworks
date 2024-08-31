output "vm_info" {

  value = [
    { dev1 = [yandex_compute_instance.platform.name, yandex_compute_instance.platform.network_interface[0].ip_address, yandex_compute_instance.platform.fqdn] },
    { dev2 = [yandex_compute_instance.platform2.name, yandex_compute_instance.platform2.network_interface[0].ip_address, yandex_compute_instance.platform2.fqdn] },
    
  ]
}