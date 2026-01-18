Домашнее задание "Основы работы с Terraform"
4. Ошибки в main.tf:
- platform_id = "standart-v4"
должно быть standard и максимуму есть v3

- core_fraction = 5 нельзя
допустимо 20, 50 или 100.
Поставлю 20

- core = 1 нельзя
допустимо 2, 4
ставлю 2

- Ошибка в имени переменной:
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
вместо vms_ssh_public_root_key, как написано в инструкции





