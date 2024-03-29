#!/usr/bin/env bash

chown -R mysql:mysql /var/lib/mysql

if [ ! -d /var/lib/mysql/wp_db ]; then
	service mysql start

	echo "Create bd"

	mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE"
	mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
	mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'"
	mysql -u root -e "FLUSH PRIVILEGES"
	mysqladmin -u root password $MYSQL_ROOT_PASSWORD
	
	echo "Create end processional"

	service mysql stop

else
	mkdir /var/run/mysqld
	touch /var/run/mysqld/mysqld.pid
	mkfifo /var/run/mysqld/mysqld.sock
fi

chown -R mysql /var/run/mysqld
exec "$@"