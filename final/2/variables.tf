variable "token" {}
variable "cloud_id" {}
variable "folder_id" {}

variable "zone" {
  default = "ru-central1-a"
}

variable "ssh_public_key" {}

variable "bucket_name" {}

variable "storage_access_key" {}
variable "storage_secret_key" {}

variable "service_account_id" {}

variable "enable_task1_vms" {
  type    = bool
  default = false
}

