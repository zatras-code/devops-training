Домашнее задание "Основы работы с Terraform"
Задание 1.
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

6. preemptible = true
ВМ может быть принудительно остановлена облаком в любой момент, гарантии времени жизни нет
Зачем в обучении:
- Сильно дешевле
- Можно держать ВМ включённой долго за малые деньги.
- Учишься работать с нестабильной инфраструктурой
- автозапуск
- Хороший триггер для IaC-мышления:
ВМ умерла → пересоздали»
не держаться за состояние сервера
понимаешь, что ВМ — расходник
привыкаешь к terraform apply, а не «бережному» ручному администрированию

core_fraction — это доля CPU во времени
cores = 2
core_fraction = 20
≈ 0.4 CPU в среднем
(но в пике может быть 2 CPU кратковременно)
Зачем в обучении:
Понимание overcommit
CPU делится между ВМ
не все ресурсы гарантированы
Отладка деградации
тормоза под нагрузкой
нестабильное время отклика
Экономия
дешёвая ВМ для:
curl
nginx
terraform
bash
Осознание, что “vCPU ≠ реальное ядро”

Задача 2.
https://github.com/zatras-code/terraform-edu/tree/40b2523f326fe085b41fbec72822961022d8de89/02/src

Задача 4.
terraform output
vms = {
  "db" = {
    "external_ip" = "84.252.136.141"
    "fqdn" = "epdr23rpan8c570int43.auto.internal"
    "instance_name" = "netology-develop-platform-db"
  }
  "web" = {
    "external_ip" = "158.160.105.121"
    "fqdn" = "fhmhv4eo7a3k64rbmqqh.auto.internal"
    "instance_name" = "netology-develop-platform-web"
  }
}
<img width="936" height="410" alt="image" src="https://github.com/user-attachments/assets/9eec6a93-2438-4cfb-b1e5-a86dbf257d7a" />

Задание 5.
<img width="1794" height="624" alt="image" src="https://github.com/user-attachments/assets/d109c652-130c-456f-aede-3dcc4c3e57dd" />

<img width="1718" height="726" alt="image" src="https://github.com/user-attachments/assets/f8dabf73-5f16-4cac-8d69-b8b09954cffe" />

