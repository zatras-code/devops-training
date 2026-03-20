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

<img width="2490" height="871" alt="изображение" src="https://github.com/user-attachments/assets/89a3c26d-8a7e-4bd6-9277-74dae8e8c080" />

3. alert-правила:
<img width="1741" height="610" alt="изображение" src="https://github.com/user-attachments/assets/e9a9f2a5-73ce-4b3b-b3d7-4bf3444272e9" />

<img width="2489" height="693" alt="изображение" src="https://github.com/user-attachments/assets/606c3ed6-2c6d-4796-9408-c1098b0f8483" />

4. Листинг файла dashboard:
