output "master_external_ip" {
  value = yandex_compute_instance.master.network_interface[0].nat_ip_address
}

output "master_internal_ip" {
  value = yandex_compute_instance.master.network_interface[0].ip_address
}

output "workers_external_ip" {
  value = yandex_compute_instance.workers[*].network_interface[0].nat_ip_address
}

output "workers_internal_ip" {
  value = yandex_compute_instance.workers[*].network_interface[0].ip_address
}
