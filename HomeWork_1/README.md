## **<u>Домашнее задание 1.</u>**

## Сборка hadoop-base-image

```
docker build -f ubuntu.Dockerfile -t hadoop-base-image . --network=host
```

## Поднятие docker-compose файла(со сборкой master и worker node)
```
docker compose up -d --build --scale worker=4
```