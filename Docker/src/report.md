

## Part 1. Ready-made docker <br>

- ``устанавливаем docker (для мак ос нужно поместить его в папку goinfre см.ниже)`` <br>

если не открываеться установленый докер туториал как пофиксить -> https://21-school-by-students.notion.site/Docker-useful-info-13e8d7058e70418b8b0c6f23639640b9``

- ``далее через терминал скачиваем nginx `` <br>
![1.1](./images/1.1.png) <br>
- ``Проверить наличие докер образа через docker images `` <br>
![1.2](./images/1.2.png) <br>
- `` Запустить докер образ через docker run -d [image_id|repository] `` <br>
![1.3](./images/1.3.png) <br>
- ``Проверить, что образ запустился через docker ps`` <br>
![1.4](./images/1.4.png) <br>
- ``Посмотреть информацию о контейнере через docker inspect [container_id|container_name] `` <br>
![1.5](./images/1.5.png) <br>
- `` По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера `` <br>
![1.6](./images/1.6.png) <br>
![1.7](./images/1.7.png) <br>
![1.8](./images/1.8.png) <br>
- ``Остановить докер образ через docker stop [container_id|container_name] `` <br>
![1.9](./images/1.9.png) <br>
- ``Проверить, что образ запустился через docker ps`` <br>
![1.10](./images/1.10.png) <br>
- ``Запустить докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду run`` <br>
![1.11](./images/1.11.png) <br>
- ``Проверить, что в браузере по адресу localhost:80 доступна стартовая страница nginx`` <br>
![1.12](./images/1.12.png) <br>
![1.13](./images/1.13.png) <br>
- ``Перезапустить докер контейнер через docker restart [container_id|container_name`` <br>
![1.14](./images/1.14.png) <br>

## Part 2. Operations with container <br>
- ``Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду exec`` <br>
![2.1](./images/2.1.png) <br>
- ``Создать на локальной машине файл nginx.conf`` <br>
![2.2](./images/2.2.png) <br>
- `` Создать на локальной машине файл nginx.conf Настроить в нем по пути /status отдачу страницы статуса сервера nginx `` <br>
![2.3](./images/2.3.png) <br>
- ``Скопировать созданный файл nginx.conf внутрь докер образа через команду docker cp `` <br>
![2.4](./images/2.4.png) <br>
- ``Перезапустить nginx внутри докер образа через команду exec`` <br>
![2.5](./images/2.5.png) <br>
- ``Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx`` <br>
![2.6](./images/2.6.png) <br>
![2.7](./images/2.7.png) <br>
- ``Экспортировать контейнер в файл container.tar через команду export`` <br>
![2.8](./images/2.8.png) <br>
- ``Остановить контейнер`` <br>
![2.9](./images/2.9.png) <br>
- ``Удалить образ через docker rmi [image_id|repository], не удаляя перед этим контейнеры`` <br>
![2.10](./images/2.10.png) <br>
- ``Удалить остановленный контейнер`` <br>
![2.11](./images/2.11.png) <br>
- ``Импортировать контейнер обратно через команду import`` <br>
![2.12](./images/2.12.png) <br>
- ``Запустить импортированный контейнер`` <br>
![2.13](./images/2.13.png) <br>
- ``Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx`` <br>
![2.14](./images/2.14.png) <br>
![2.15](./images/2.15.png) <br>

## Part 3. Mini web server <br>
- ``Написать мини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!`` <br>
![3.1](./images/3.1.png) <br>
- ``Написать свой nginx.conf, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080`` <br>
![3.2](./images/3.2.png) <br>
- ``Запустить написанный мини сервер через spawn-fcgi на порту 8080`` <br>
- ``    последовательность действий`` <br>
- ``docker pull nginx ``
- ``docker images``
- ``docker run -d -p 81:81 [DOCKER_ID]``
![3.3](./images/3.3.png) <br>
![3.4](./images/3.4.png) <br>
- `` docker cp nginx.conf [CONTAINER ID]:/etc/nginx/ `` <br>
- `` docker cp server.c [CONTAINER ID]:/home/ `` <br>
- `` docker exec -it [CONTAINER ID] bash     // чтобы подключиься к контейнеру`` <br>

#### настройка окружения внутри контейнера <br>

- ``apt-get update`` <br>
- ``apt-get install gcc`` <br>
- ``apt-get install spawn-fcgi`` <br>
- ``apt-get install libfcgi-dev`` <br>
- ``gcc *.c -lfcgi`` <br>
- ``spawn-fcgi -p 8080 /screenshots/a.out`` <br>
- ``nginx -s reload`` <br>
![3.5](./images/3.5.png) <br>
![3.6](./images/3.6.png) <br>
![3.7](./images/3.7.png) <br>
![3.8](./images/3.8.png) <br>
- ``Проверить, что в браузере по localhost:81 отдается написанная вами страничка `` <br>
![3.9](./images/3.9.png) <br>

## Part 4. Your own docker <br>

- ``Написать свой докер образ, который:`` <br>
- `` 1) собирает исходники мини сервера на FastCgi из Части 3`` <br>
- `` 2) запускает его на 8080 порту`` <br>
- `` 3) копирует внутрь образа написанный ./nginx/nginx.conf`` <br>
- `` 4) запускает nginx.`` <br>
![4.1](./images/4.1.png) <br>
![4.2](./images/4.2.png) <br>

- ``собрали Docker`` <br>
![4.3](./images/4.3.png) <br>

- ``Проверить через docker images, что все собралось корректно`` <br>
![4.4](./images/4.4.png) <br>
- ``Запустить собранный докер образ с маппингом 81 порта на 80 на локальной машине и маппингом папки ./nginx внутрь контейнера по адресу, где лежат конфигурационные файлы nginx'а (см. Часть 2)`` <br>
![4.5](./images/4.5.png) <br>
- ``Проверить, что по localhost:80 доступна страничка написанного мини сервера`` <br>
![4.6](./images/4.6.png) <br>
- ``Дописать в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx`` <br>
![4.7](./images/4.7.png) <br>

## Part 5. Dockle <br>

- `` Перед началом устанавливаем утилиту dockle: $ brew install goodwithtech/r/dockle `` <br>
![5.1](./images/5.1.png) <br>

- `` проверяем наш dockerfile через утилиту dockle `` <br>
![5.2](./images/5.2.png) <br>
- ``текущий билд докера`` <br>
![5.3](./images/5.3.png) <br>
- ``исправленный билд: удоляем текущую сборку командой  $ docker system prune --all, собираем заново`` <br>
![5.4](./images/5.4.png) <br>
- ``Исправить образ так, чтобы при проверке через dockle не было ошибок и предупреждений`` <br>
![5.5](./images/5.5.png) <br>
![5.6](./images/5.6.png) <br>

## Part 6. Basic Docker Compose <br>

- `` Написать файл docker-compose.yml, с помощью которого: ``<br>
- `` 1) Поднять докер контейнер из Части 5 (он должен работать в локальной сети, т.е. не нужно использовать инструкцию EXPOSE и мапить порты на локальную машину) `` <br>
- `` 2) Поднять докер контейнер с nginx, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера  `` <br>
![6.1](./images/6.1.png) <br>

- ``устанавливаем $brew install docker-compose`` <br>
![6.2](./images/6.2.png) <br>
- ``docker-compose build`` <br>
![6.3](./images/6.3.png) <br>
- ``docker-compose up`` <br>
![6.4](./images/6.4.png) <br>
![6.5](./images/6.5.png) <br>
![6.6](./images/6.6.png) <bt>
![6.7](./images/6.7.png) <br>
![6.8](./images/6.8.png) <br>



