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
<img width="1206" height="166" alt="изображение" src="https://github.com/user-attachments/assets/93b3c144-7950-4b99-a04f-91ecf11a75db" />
Краткое объяснение проблемы:
Docker пробросил порт 127.0.0.1:8080 на порт 80 контейнера (это видно в docker port).
Мы изменили nginx так, что он теперь слушает 81, а на 80 внутри контейнера никто не слушает.
Поэтому на хосте curl http://127.0.0.1:8080 перестал работать: запрос приходит в контейнер на 80, а nginx там уже не принимает.

Доп задание:
<img width="1194" height="649" alt="изображение" src="https://github.com/user-attachments/assets/0e646573-e7b3-4ef6-a4f2-68312d8340f1" />
<img width="1069" height="754" alt="изображение" src="https://github.com/user-attachments/assets/5cc481f9-4eae-4110-9c97-b8c6b9826bb3" />
<img width="1155" height="131" alt="изображение" src="https://github.com/user-attachments/assets/11db67c6-60a3-41c7-ab98-9e25e19bc9df" />

Задание 4.
<img width="1902" height="910" alt="image" src="https://github.com/user-attachments/assets/64b554cf-78f0-4d56-8f40-4f5330eb0839" />
<img width="1876" height="784" alt="image" src="https://github.com/user-attachments/assets/0d715d6e-654f-47c0-b4d3-3cadb554ec5b" />

Задание 5.
<img width="1804" height="264" alt="image" src="https://github.com/user-attachments/assets/b6acd7e4-60f8-43e3-a1d5-02d7311a8f54" />
Ответ почему:
По умолчанию docker compose ищет compose-файл в порядке: compose.yaml / compose.yml, docker-compose.yaml / docker-compose.yml.
Поэтому при наличии compose.yaml и без ключа -f будет использован compose.yaml, и запустится только portainer.

