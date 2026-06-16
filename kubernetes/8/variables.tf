variable "yc_token" {}
variable "cloud_id" {}
variable "folder_id" {}

variable "zone" {
  default = "ru-central1-a"
}

variable "ubuntu_image_id" {
  description = "Ubuntu 20.04 LTS image id"
}

variable "ssh_public_key" {}
