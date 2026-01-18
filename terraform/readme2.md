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
Написал в переменные как в main.tf

5. Подключение к ВМ
<img width="1124" height="886" alt="image" src="https://github.com/user-attachments/assets/bab0b921-d275-457b-a1ba-624b9f229df6" />

<img width="1242" height="520" alt="image" src="https://github.com/user-attachments/assets/51cc1f01-2206-4838-ba85-af7659674eb7" />



<img width="1126" height="452" alt="image" src="https://github.com/user-attachments/assets/3b0862b4-1e86-4649-b793-ba264cf1b473" />






