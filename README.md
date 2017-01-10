# rls-docker

## Короткий todo для запуска
* Меняем ветку ```git checkout origin/[5.3/5.5/5.6/7.0]```
* меняем dump.sql на нужную БД (название и расположение ```./dump.sql```)
* собираем _image_ ```sudo docker build -t test/[5.3/5.5/5.6/7.0] .```
* запускаем ```sudo docker run -d -p 880:80 -p 222:22 -p 33306:3306 -v $(pwd)/www:/var/www/html:rw test/[5.3/5.5/5.6/7.0]```
* работаем-работаем :yum:
* убиваем контейнер ```sudo docker ps```, ```sudo docker kill CONTAINER_ID```
* и по кругу :yum:
## Для работы в консоле (внутри docker container\`а)
* ```sudo docker ps```
* ```sudo docker exec -i -t CONTAINER_ID /bin/bash/```


## Для начала нам нужно установить Docker (у меня Ubuntu 14.04)
```
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv \
               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
```
_выберите свою версию Ubuntu_
<table>
<thead>
<td>Ubuntu version</td>
<td>Repository</td>
</thead>
<tr>
<td>Precise 12.04 (LTS)</td>
<td>deb https://apt.dockerproject.org/repo ubuntu-precise main</td>
</tr>
<tr>
<td>Trusty 14.04 (LTS)</td>
<td>deb https://apt.dockerproject.org/repo ubuntu-trusty main</td>
</tr>
<tr>
<td>Wily 15.10 </td>
<td>deb https://apt.dockerproject.org/repo ubuntu-wily main</td>
</tr>
<tr>
<td>Xenial 16.04 (LTS) </td>
<td>deb https://apt.dockerproject.org/repo ubuntu-xenial main</td>
</tr>
</table>
вместо ```<REPO>```, я например вставляю ```deb https://apt.dockerproject.org/repo ubuntu-trusty main ```(версию Ubuntu)
```
echo "<REPO>" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get update
sudo apt-get install docker-engine
sudo service docker start
```
### _Ура, мы установили docker_

## Далее скачиваем git репозиторий 
```
git clone https://github.com/paradoxofvalue/rls-docker.git
```
есть несколько веток c разными версиями php: ```5.3```, ```5.4```, ```5.5```, ```5.6```, ```7.0```
если нам нужен, например php5.3
```
git checkout origin/5.3
```
если нам нужен, например php5.5
```
git checkout origin/5.5
```
и тд.

## Далее будем собирать docker ```image```

> ###!!!перед тем как собирать _image_, мы должны переместить нашу БД и переименовать ее в `dump.sql`!!!

_в нашем случае, сейчас мы хотим работать с **php5.3**_
```
sudo docker build -t test/5.3 .
```
> вместо ```test/5.3``` можно писать что угодно, но я обозвал так что бы было удобно обзывать его потом

> ```.``` это текущая папка

Теперь мы можем запустить наш image
```
sudo docker run -d -p 880:80 -p 222:22 -p 33306:3306 -v $(pwd)/www:/var/www/html:rw test/5.3
```
Спокойно переходим на ```localhost:880```, ```localhost:880/phpmyadmin```

### файлы с которыми мы хотим работать помещаем в ```rls-docker/www```
>> могут быть проблемы с ```.htaccess``` или доступом, это можно пофиксить ```sudo chmod 777 -R .```

> логин/пароль к mysql: ```root/root```

## Для разворачивания другой версии php, мы должны сначала выключить другой ```container``` (так как используются одинаковые порты)
выводим все запущенные контейнеры
```
sudo docker ps
```
копируем ```CONTAINER ID```, и
```
sudo docker kill CONTAINER_ID
```
теперь у нас должен упасть сервер, проверим ```localhost:880```, _да упал =)_
## Для сборки нового ```image```
* Меняем ветку ```git checkout origin/[5.3/5.5/5.6/7.0]```
* меняем dump.sql на нужную БД (название и расположение ```./dump.sql```)
* собираем _image_ ```sudo docker build -t test/[5.3/5.5/5.6/7.0] .```
* запускаем ```sudo docker run -d -p 880:80 -p 222:22 -p 33306:3306 -v $(pwd)/www:/var/www/html:rw test/[5.3/5.5/5.6/7.0]```
* работаем-работаем :yum:
* убиваем контейнер ```sudo docker ps```, ```sudo docker kill CONTAINER_ID```
* и по кругу :yum:
