#!/bin/bash


service mariadb start

sleep 10


mariadb -e "CREATE DATABASE IF NOT EXISTS $MY_DB;"
mariadb -e "CREATE USER IF NOT EXISTS '$MY_DB_USER'@'%' IDENTIFIED BY '$MY_DB_PASS';"
mariadb -e "GRANT ALL PRIVILEGES ON $MY_DB.* TO '$MY_DB_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

mariadb -e "SHUTDOWN;"

sleep 10

mysqld --user=mysql --bind-address=0.0.0.0 2>/dev/null
