# Databases

Running databases from inside of Docker.

```bash
docker volume create data_mysql_8.4
docker run --name mysql-8.4 \
  -v data_mysql_8.4:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=inloggen12 -d mysql:lts
```
