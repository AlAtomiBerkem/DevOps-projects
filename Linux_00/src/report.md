# REPORT DevOps 1 Linux <br>

## Part 1. Installation of the OS <br>

- ``Смотрим версию Ubuntu после установки $ cat /etc/issue`` <br>
![Версия Linux](./images/1.1%20%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%8F%20linux.png) <br>


---

## Part 2. Creating a user <br>

- `` команда создания нового пользователя $ sudo useradd 'user-name' `` <br>
- `` Команда добавления нового user-а в группу adm $ sudo usermod -aG adm 'username' `` <br>
![команда создания нового user](./images/2.1%20%D0%BA%D0%BE%D0%BC%D0%B0%D0%BD%D0%B4%D0%B0%20%D1%81%D0%BE%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D1%8F%20%D0%BD%D0%BE%D0%B2%D0%BE%D0%B3%D0%BE%20user.png) <br>

- ``вывод нового user на экран $ cat /etc/passwd `` <br>
![новый пользователь](./images/2.2%20%D0%BE%D1%82%D1%87%D0%B5%D1%82%20.png) <br>


---

## Part 3. Setting up the OS network <br>

- `` команда изминения хоста $ sudo hostnamectl set-hostname 'new-name' `` <br>
- `` прсмотреть имя хоста $ hostnamectl `` <br>
![новое имя машины](./images/3.1%20%D0%BD%D0%BE%D0%B2%D0%BE%D0%B5%20%D0%B8%D0%BC%D1%8F%20%D1%85%D0%BE%D1%81%D1%82%D0%B0.png) <br>

- `` чтобы посмотреть список доступных временных зон $ timedatectl list-timezone `` <br>
- `` Чтобы поменять времменую зону введите команду $ sudo timedatectl set-timezone 'Europe/Moscow `` <br>
- `` посмотреть текущую временную зону $ timedatectl `` <br>
![вреенная зона](./images/3.2%20time-zone.png) <br>

- `` устонавливаю утилиту net-tools $ sudo apt install net-tools `` <br>
- `` вывод информации о сетевых интерфейсах $ sudo ifconfig -a `` <br>
![информация о сетях](./images/3.3%20net-information.png) <br>

- `` Интерфейс "lo" в сети linux является особбеным и обозначает "loopback" или петлевой интерфейс этот интерфейс предстаавляет собой виртуальны сетевой интерфейс присуцтвует на всех linux `` <br> 
- `` Адресс ip 127.0.0.1 по началу lo настроен на это сетевой адресс, ипользуется для локального тестирования и отладки систем `` <br>
![lo](./images/3.4%20'lo'.png) <br>


- `` DHCP - (Dynamic Host Configuration Protocol) - это протокол сетевой конфигурации, который используется для автоматической настройки IP-адресов и других параметров сети для устройств , подключенных к сети, таких как компьютеры, смартфоны, принтеры и другие сетевые устройства. DHCP позволяет упростить процесс настройки сети, особенно в больших сетях.(Dynamic Host Configuration Protocol) - это протокол сетевой конфигурации, который используется для автоматической настройки IP-адресов и других параметров сети для устройств, подключенных к сети, таких как компьютеры, смартфоны, принтеры и другие сетевые устройства. DHCP позволяет упростить процесс настройки сети, особенно в больших сетях. `` <br>
- `` получение ip от dhcp сервера $ hostname -I `` <br>
![ip](./images/3.5%20ip.png) <br>

- `` узнвем внешний ip adress $ curl ifconfig.me/ip `` <br>
![curl ip](./images/3.6%20%D0%B2%D0%BD%D0%B5%D1%88%D0%BD%D0%B8%D0%B9%20ip.png) <br>
- `` узнаем внутренний ip (gw) $ ip route `` <br>
![route](./images/3.7%20route.png) <br>

- `` меняем настройки сети vim-ом $ sudo vim /etc/netplan/*.yaml , сохроняем и перезагружаем $ reboot ``<br>
![ручками поработали](./images/3.8%20%D1%80%D1%83%D1%87%D0%BD%D0%B0%D1%8F%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0.png) <br>
- `` проверка пинга 1.1.1.1  и ya.ru $ ping 1.1.1.1 \\ $ ping ya.ru`` <br>
![ping 1.1.1.1](./images/ping%201.1.1.1.png) <br>
![ping ya.ru](./images/ping%20ya.ru.png0) <br>
- `` проверка на потерю покетов $ ping -v [host] `` <br>
![packet losssss](./images/packet%20loss%200.png) <br>

---

## Part 4. OS Update <br>
- `` Обновление сиситемных пакетов $ sudo apt update `` <b>
![update](./images/4%20update.png) <br>

---

## Part 5. Using the sudo command <br>

- `` sudo - Superuser Do это команда и механизм в Unix подобных операционных систем таких как linux и macOs `` <br>
- `` С помощью sudo обычныее пользователи могут выполнить команды, требующие административных прав, после футенфикации `` <br>
- `` Аудит и учет использование sudo каждый запуск sudo можно отслеживать и анализировать кто и когда выполнял когда-либо административные действия `` <br>
-  `` тобы предоставить пользователю права выполнения команд с использованием sudo $  sudo usermod -aG sudo "user" чтобы проверить вступило ли изменение в силу $ groups "user" `` <br>
- `` переключитель на другого пользователя и спенили hostname `` <br>
![new hostname](./images/5%20new%20hostname.png) <br>

---

## Part 6. Installing and configuring the time service <br>
- `` проверка статуса службы $ systemctl status systemd-timesyncd `` <br>
- `` если служба выключена вводим $ sudo systemctl enable systemd-timesyncd ``<br>
- `` проверка параметров службы $ timedatectl show `` <br>
![time](./images/6%20time.png)

--

## Part 7. Installing and using text editors <br>
- `` установка vim, nano, joe $ sudo apt instal "редактор" `` <br>
![vim](./images/instal%20vim.png) <br>
![nano](./images/instal%20nano.png) <br>
![joe](./images/instal%20joe.png)<br>

- `` чтобы создать файл в vim вводим $ vim text_file.txt чтобы редактировать текст нажимаем 'i' чтобы сохранить и выйти наимаем 'esc' 'shift' + ':' и вводим 'wq' чтобы выйти без сохронения 'q!'`` <br>
![vim text](./images/7%20vim%20text%20file.png) <br>
- `` чтобы создать файл в nano вводим $ nano text_file.txt редактируем, сохроняем 'ctr' + 'o' и выходим 'ctr' + 'x' чтобы выйти без сохранений нажмите 'ctr' + 'x' + 'N'`` <br>
![nano file](./images/7%20nano%20text%20file.png) <br>
- `` чтобы создать файл в joe вводим $ joe text_file.txt чтобы сохранить 'ctr' + 'k' выйти 'ctr' + 'c' выйти без сохранения ctr + k + Q + n`` <br>
![joe file](./images/7%20joe%20text%20file.png)<br>

- `` чтобы искать слово в vim нажать '/' `` <br>
![vim search](./images/7%20search%20vim.png) <br>
- `` чтобы искать слово в nano 'ctr' + 'w' `` <br>
![nano search](./images/7%20search%20nano.png) <br>
- `` чтобы искать в joe 'ctr' + K + F `` <br>
![joe search](./images/7%20search%20joe.png) <br>

---

## Part 8. Installing and basic setup of the SSHD service <br>

 - `` скачиваем shh-server $sudo apt install openssh-server и ставим автозапуск $ sudo systemctl enable ssh `` <br>
 ![shh enable](./images/8.1%20ssh%20enable.png) <br>

 - `` меняем порт $ sudo nano /etc/ssh/sshd_config  и перезагружаем службу ssh $sudo systemctl restart ssh `` <br>
 ![2022](./images/8.2%202022.png) <br>
 ![restart](./images/8.2.1%20restart%20ssh.png) <br>


- `` команда для нахождения процесса ssh $ ps -e | grep sshd `` 
![ps ssh](./images/8.4%20ps%20ssh.png) <br>

ps -e или ps -A (Чтобы просмотреть все запущенные процессы);<br>
ps -d (Чтобы показать все процессы, кроме лидеров сессии);<br>
ps -d -N (можно инвертировать вывод с помощью переключателя -N. Например, если хочу вывести только лидеров сеансов)
ps T (увидеть только процессы, связанные с этим терминалом);<br>
ps r (просмотреть все работающие (running) процессы);<br>
ps -p 'pid' (если вы знаете идентификатор процесса PID, вы можете просто использовать следующую команду, для вывода процесса с этим 'pid');<br>
ps -p 'pid1' 'pid2'
ps U 'userlist' (найти все процессы, выполняемые конкретным пользователем);<br>
ps -ef (получить полный список);<br>

- `` рестартаем систему $ netstat - tan ``
![netstat](./images/8.3%20netstat.png) <br>

Флаги для netstat : -t (--tcp) отображает только tcp соединения; -a (--all) отображает все активные TCP соединения; -n (--numeric) отображает активные TCP соединения с адресами и номерами портов в числовом формате; Proto: имя протокола (протокол TCP или протокол UDP); recv-Q: очередь на получение сети; end-Q: очередь на отправку сети; Local Address адрес локального компьютера и номер используемого порта; Foreign Address адрес и номер удаленного устройства, к которому подключен сокет; State состояние сокета; 0.0.0.0 означает IP-адрес локального устройства.

---

## Part 9. Installing and using the top, htop utilities <br>

- `` установка утилиты htop  $ sudo apt install htop, установка утилиты top $ sudo apt install procps `` <br>
![install](./images/9.1%20install.png) <br>

-  'u' + 'uptime' кол-во авторизованых пользоватеелй 1; <br>
- время работы 11 min; <br>
- общая загруженность сиситемы - 0.00 0.00 0.01 <br>
- общее количество процессов 94 <br>
- загрузка цпу 0.3 <br>
- загрузка памяти 138.1/956 <br>
- pid процесс занимающий больше всего памяти 651, использовал комбинацию 'shift' + 'M' или top -o %MEM <br>
- pid процесс занимающий больше всего времени - 383 комбинация shift + P или top -o %CPU <br>


- `` команды htop '/' - поиск процесса,  '\' - фильровать процесс `` <br>
![htop pid](./images/9.2%20htop%20pid.png) <br>
![htop cpu](./images/9.3%20htop%20cpu.png) <br>
![htop mem](./images/9.4%20mem.png) <br>
![htop time](./images/9.5%20time.png) <br>
![htop sshd](./images/9.6%20sshd%20filter.png) <br>
![htop syslog](./images/9.7%20syslog.png) <br>
![htop clock](./images/9.7%20clock.png) <br>

---

## Part 10. Using the fdisk utility <br>

- `` $ sudo fdisk -l || $ sudo swapon`` <br>
![fdisk](./images/10%20fdisk.png) <br>
- размер swap - 1.5g <br>
- название жесткого диска - VBOXHARDDISK <br>
- размер 10gib <br>
- количество секторов 20971520 <br>

---

## Part 11. Using the df utility <br>
** df / ** <br>
- размер раздела - 8408452 <br>
- размер занятого пространства - 4203028 <br>
- разммер свободного пространства - 3756708 <br>
- процент использования - 53% <br>

![df](./images/11.1%20df.png) <br>


** df -Th /** <br>

- размер раздела - 8.1Gb;<br>
- размер занятого пространства - 4.1Gb;<br>
- размер свободного пространства - 3.6Gb;<br>
- процент использования - 53%;<br>

![df th](./images/11.2%20df%20th.png) <br>

- `` ext 4 журналированнная файловая система, используется премущественно в операционных системах с ядром Linux. Для записи журнала реализованно вычесление контрольных сумм, что позволяет быстрее находить и в некоторых испровлять ошибки системы ``  <br>

---

## Part 12. Using the du utility <br>

![du](./images/12.1.png) <br>

- человеческом виде <br>
![du bytes](./images/12.2.png)

---

## Part 13. Installing and using the ncdu utility <br>

- `` sudo apt install ncdu `` <br>

- `` sudo /home `` <br>
![home](./images/13.1.png) <br>

- `` sudo /var `` <br>
![var](./images/13.2.png) <br>

- `` sudo /var/log `` <br>
![log](./images/13.3.png) <br>

---

## Part 14. Working with system logs <br>

- `` cat /var/log/dmesg`` <br>
![cat d](./images/14.1%20%20dmesg.png) <br>

- `` cat /var/log/syslog `` <br>
![syslog](./images/14.2%20syslog.png) <br>

- `` последняя авторизация sep 26 13:17:01 pam_unix(cron:session) ``

- `` перезапускаем sshd `` <br>
![restart sshd](./images/14.4%20restart.png) <br>


## Part 15. Using the CRON job scheduler <br>

- `` чтобы задать новую задачу в утилите cron команда $ crontab -e просмотреть список текущих задач  -e удалить -r``<br>
![15.1](./images/15.1.png) <br>
![15.2](./images/15.2.png) <br>
![15.3](./images/15.3.png) <br>
![14.4](./images/15.4%20report.png) <br>
