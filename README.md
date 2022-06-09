# Домашняя работа "Практика systemd"

### Написать сервис, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова. Файл и слово должны задаваться в /etc/sysconfig

+ Спроектирована роль [systemd](roles/systemd), которая разворачивает сервис и запускает таймер
+ [script1.sh](script1.sh) запускает процесс

### Из epel установить spawn-fcgi и переписать init-скрипт на unit-файл. Имя сервиса должно также называться.

+ Роль [spawn](roles/spawn) выполняет задачу
+ [script2.sh](script2.sh) запускает процесс

### Дополнить Юнит-файл apache httpd возможностью запустить несколько инстансов сервера с разными конфигами 

! Столкнулся с проблемой. Файл httpd@.service подсовывал в /etc/systemd/system/. 
Вылезала ошибка:

```out1
fatal: [systemd]: FAILED! => {"changed": true, "cmd": "systemctl start httpd@first.service", "delta": "0:00:00.036927", "end": "2022-06-09 19:59:13.328938", "msg": "non-zero return code", "rc": 1, "start": "2022-06-09 19:59:13.292011", "stderr": "Warning: httpd@first.service changed on disk. Run 'systemctl daemon-reload' to reload units.\nJob for httpd@first.service failed because a configured resource limit was exceeded. See \"systemctl status httpd@first.service\" and \"journalctl -xe\" for details.", "stderr_lines": ["Warning: httpd@first.service changed on disk. Run 'systemctl daemon-reload' to reload units.", "Job for httpd@first.service failed because a configured resource limit was exceeded. See \"systemctl status httpd@first.service\" and \"journalctl -xe\" for details."], "stdout": "", "stdout_lines": []}

```
Решение:

Основной юнит httpd находился по пути /usr/lib/systemd/system/.
Направил туда - все завелось.

+ Роль [http](roles/http) выполняет задачу
+ [script3.sh](script3.sh) запускает процесс 