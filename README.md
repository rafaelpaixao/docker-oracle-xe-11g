docker-oracle-xe-11g
============================

Oracle Express Edition 11g Release 2 on Ubuntu 18.04 LTS

# How to start the server
```
docker-compose up
```
Connect database with following setting:
```
hostname: localhost
port: 49161
sid: xe
username: system
password: oracle
```

# Sample database
While the server is running, do:
```
docker exec -it oracle-11g sh /sample/run.sh
```
