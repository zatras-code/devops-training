output "public_vm_external_ip" {
  value = var.enable_task1_vms ? yandex_compute_instance.public_vm[0].network_interface[0].nat_ip_address : null
}

output "public_vm_internal_ip" {
  value = var.enable_task1_vms ? yandex_compute_instance.public_vm[0].network_interface[0].ip_address : null
}

output "private_vm_internal_ip" {
  value = yandex_compute_instance.private_vm.network_interface[0].ip_address
}

output "load_balancer_id" {
  value = yandex_lb_network_load_balancer.lb.id
}

output "bucket_name" {
  value = yandex_storage_bucket.bucket.bucket
}

output "bucket_image_url" {
  value = "https://${yandex_storage_bucket.bucket.bucket}.storage.yandexcloud.net/image.jpg"
}
