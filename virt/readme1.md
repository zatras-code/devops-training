Домашнее задание к занятию 4 «Оркестрация группой Docker контейнеров на примере Docker Compose»
Задача 1.
https://hub.docker.com/repository/docker/zatrascode/custom-nginx/general

Задача 2.
<img width="1844" height="555" alt="изображение" src="https://github.com/user-attachments/assets/bcd15fe5-deb3-4ac3-9a3b-fc0a94694cec" />
<img width="991" height="531" alt="изображение" src="https://github.com/user-attachments/assets/5542c8ca-f3e3-4b26-aa6d-0d31a9330347" />

Задача 3.
<img width="1198" height="575" alt="изображение" src="https://github.com/user-attachments/assets/4f924491-ca56-4c8a-b8e9-8f8abd84f956" />
Объяснение причин закрытия контейнера:
docker attach подключается к главному процессу контейнера (PID 1).
Ctrl-C отправляет этому процессу сигнал SIGINT.
В образе nginx главный процесс — это nginx, он завершился, соответственно docker считает контейнер завершённым, поэтому контейнер остановился.
<img width="1364" height="633" alt="изображение" src="https://github.com/user-attachments/assets/675b7e85-f39f-4c94-8a60-85b0b079b251" />
<img width="1114" height="654" alt="изображение" src="https://github.com/user-attachments/assets/b1294a71-c68c-4d8f-9e9e-cde55b048c5e" />


