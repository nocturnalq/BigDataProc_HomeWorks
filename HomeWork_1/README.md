## **<u>Домашнее задание 1.</u>**

## Сборка hadoop-base-image

```
docker build -f ubuntu.Dockerfile -t hadoop-base-image . --network=host
```

## Поднятие docker-compose файла(со сборкой master и worker node)
```
docker compose up -d --build --scale worker=4
```
## Результат:
```
nocturnalq@1440:~/BigDataProc_HomeWorks/HomeWork_1$ dcompose up -d --scale worker=4
[+] Running 6/6
 ⠿ Network homework_1_hd-network  Created                                                                                                                                                        0.1s
 ⠿ Container master               Started                                                                                                                                                        0.9s
 ⠿ Container homework_1-worker-4  Started                                                                                                                                                        2.3s
 ⠿ Container homework_1-worker-2  Started                                                                                                                                                        3.2s
 ⠿ Container homework_1-worker-1  Started                                                                                                                                                        1.6s
 ⠿ Container homework_1-worker-3  Started                                                                                                                                                        0.9s
nocturnalq@1440:~/BigDataProc_HomeWorks/HomeWork_1$ docker ps
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS          PORTS                                                                                                                                 NAMES
e992daf26c9f   hadoop-worker-image   "sh /usr/local/bin/e…"   11 seconds ago   Up 10 seconds                                                                                                                                         homework_1-worker-3
5e8e828c17bc   hadoop-worker-image   "sh /usr/local/bin/e…"   11 seconds ago   Up 9 seconds                                                                                                                                          homework_1-worker-1
575128363fa7   hadoop-worker-image   "sh /usr/local/bin/e…"   11 seconds ago   Up 9 seconds                                                                                                                                          homework_1-worker-4
ceb52d19139e   hadoop-master-image   "sh /usr/local/bin/e…"   11 seconds ago   Up 10 seconds   0.0.0.0:8088->8088/tcp, :::8088->8088/tcp, 0.0.0.0:9870->9870/tcp, :::9870->9870/tcp, 0.0.0.0:19888->19888/tcp, :::19888->19888/tcp   master
8d8762373a70   hadoop-worker-image   "sh /usr/local/bin/e…"   11 seconds ago   Up 8 seconds                                                                                                                                          homework_1-worker-2
nocturnalq@1440:~/BigDataProc_HomeWorks/HomeWork_1$ 
```

