Задание 2.
1. 
<img width="1027" height="732" alt="изображение" src="https://github.com/user-attachments/assets/d4679980-1c15-4468-9458-3d0dcfefc66a" />

2. Создан Dashboard со следующими панелями:

Утилизация CPU:
100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

CPU Load Average 1/5/15:
node_load1
node_load5
node_load15

Свободная оперативная память:
node_memory_MemAvailable_bytes / 1024 / 1024 / 1024

Свободное место на файловой системе:
node_filesystem_avail_bytes{fstype!~"tmpfs|overlay"} / 1024 / 1024 / 1024

Скрин 

3. Созданы alert-правила:

CPU usage > 85%:
100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 85

Load Average высокий:
node_load15 > 2

Мало свободной памяти:
node_memory_MemAvailable_bytes < 500 * 1024 * 1024

Мало свободного места:
(node_filesystem_avail_bytes{fstype!~"tmpfs|overlay"} / node_filesystem_size_bytes{fstype!~"tmpfs|overlay"}) * 100 < 15

Скрин

4. Dashboard сохранён через JSON Model, содержимое экспортировано в отдельный файл.
Листинг файла:
