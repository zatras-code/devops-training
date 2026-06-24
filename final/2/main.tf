terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.153"
    }
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

# -------------------------
# NETWORK
# -------------------------

resource "yandex_vpc_network" "net" {
  name = "block15-net"
}

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.zone
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = var.zone
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = ["192.168.20.0/24"]
  route_table_id = yandex_vpc_route_table.private_rt.id
}

resource "yandex_vpc_route_table" "private_rt" {
  name       = "private-rt"
  network_id = yandex_vpc_network.net.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"
  }
}

# -------------------------
# NAT
# -------------------------

resource "yandex_compute_instance" "nat" {
  count = var.enable_task1_vms ? 1 : 0
  name = "nat"
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    ip_address = "192.168.10.254"
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }
}

# -------------------------
# IMAGE
# -------------------------

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2404-lts"
}

# -------------------------
# PUBLIC VM
# -------------------------

resource "yandex_compute_instance" "public_vm" {
  count = var.enable_task1_vms ? 1 : 0
  name = "public-vm"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    nat        = true
    ip_address = "192.168.10.10"
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }
}

# -------------------------
# PRIVATE VM
# -------------------------

resource "yandex_compute_instance" "private_vm" {
  name = "private-vm"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.private.id
    ip_address = "192.168.20.10"
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }
}

# -------------------------
# OBJECT STORAGE
# -------------------------
resource "yandex_storage_bucket" "bucket" {
  bucket     = var.bucket_name
  access_key = var.storage_access_key
  secret_key = var.storage_secret_key

  acl = "public-read"
}

resource "yandex_storage_object" "image" {
  bucket = yandex_storage_bucket.bucket.bucket
  key    = "image.jpg"
  source = "image.jpg"
}


# -------------------------
# LAMP INSTANCE GROUP
# -------------------------

locals {
  image_url = "https://${yandex_storage_bucket.bucket.bucket}.storage.yandexcloud.net/image.jpg"
}

resource "yandex_compute_instance_group" "lamp" {
  name               = "lamp-group"
  folder_id          = var.folder_id
  service_account_id = var.service_account_id

  instance_template {
    platform_id = "standard-v3"

    resources {
      cores  = 2
      memory = 2
    }

    boot_disk {
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
      }
    }

    network_interface {
      subnet_ids = [yandex_vpc_subnet.public.id]
    }

    metadata = {
      user-data = <<EOF
#cloud-config
write_files:
  - path: /var/www/html/index.html
    content: |
      <html>
        <body>
          <h1>LAMP Instance Group</h1>
          <img src="${local.image_url}" width="400"/>
        </body>
      </html>
EOF
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = [var.zone]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 1
  }

  health_check {
    http_options {
      port = 80
      path = "/"
    }
  }
}

# -------------------------
# TARGET GROUP (ВАЖНО)
# -------------------------

resource "yandex_lb_target_group" "lamp_tg" {
  name = "lamp-tg"

  dynamic "target" {
    for_each = yandex_compute_instance_group.lamp.instances

    content {
      subnet_id = target.value.network_interface[0].subnet_id
      address   = target.value.network_interface[0].ip_address
    }
  }
}

# -------------------------
# LOAD BALANCER
# -------------------------

resource "yandex_lb_network_load_balancer" "lb" {
  name = "block15-lb"

  listener {
    name        = "http"
    port        = 80
    target_port = 80
    protocol    = "tcp"
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.lamp_tg.id

    healthcheck {
      name = "http"

      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
