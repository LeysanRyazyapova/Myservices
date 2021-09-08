#!/bin/bash
rc default
rc-service mariadb setup
rc-service mariadb start
echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "CREATE USER 'tmiranda'@'%' IDENTIFIED BY 'qwerty';"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'tmiranda'@'%' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password
mysql -u root wordpress < wordpress.sql
rc-service mariadb stop
exec /usr/bin/mysqld --user=root --datadir=/var/lib/mysql