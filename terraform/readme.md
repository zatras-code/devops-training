Скрин установленного терраформ 1.12.0

<img width="424" height="69" alt="image" src="https://github.com/user-attachments/assets/f150bfd7-a3cc-4c0b-a3b3-7d992a0cf723" />

Задание 1.

2. Согласно .gitignore допустимо сохранить личную секретную информацию (логины,пароли,ключи,токены и тд) в допустимо хранить в файле personal.auto.tfvars

3. Результат выполнения 
result: Nr040TMGpLoS0Uhg

4. Ошибки в закомментированном коде:
- Неправильное объявление docker_image: у resource обязательно должны быть тип и имя
- Неверная ссылка на ресурс random_password FAKE и добавлены большие буквы в resuLT
- Ссылка на docker_image.nginx возможна только если имя ресурса nginx, а не 1nginx
  
5. Исправленный кусок кода:
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
b3007228a53b   4af177a024eb   "/docker-entrypoint.…"   5 seconds ago   Up 4 seconds   0.0.0.0:9090->80/tcp   example_Nr040TMGpLoS0Uhg

6. terraform apply -auto-approve 
Это означает применить изменения без запроса подтверждения.
Опасность: 
- удалятся ресурся
- потеряются данные
- финансовые потери в бизнесе
  
Когда это используют:
- в CI/CD
- в учебных заданиях
- в тестовой среде

