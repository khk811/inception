#!/bin/sh

if [ ! -e /var/lib/mysql/.root_pw_reset ]; then
	echo "===[INITIAL DB CONFIGURATION]===\n"
	echo "[MARIADB START]\n"
	service mariadb start 2> /dev/null

	echo "[CHANGE WORKING DIR PREVILEGE]\n"
	chmod -R 777 /var/lib/mysql
	chown -R mysql:mysql /var/lib/mysql

	echo "[CREATE WORDPRESS DB AND WORDPRESS USER]\n"
	mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};\
	CREATE USER IF NOT EXISTS ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';\
	GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';\
	FLUSH PRIVILEGES;"

	echo "[CREATE WORDPRESS ADMIN USER]\n"
	mysql -e "CREATE USER IF NOT EXISTS ${WORDPRESS_ADMIN_USER}@'%' IDENTIFIED BY '${WORDPRESS_ADMIN_PASSWORD}';\
	GRANT ALL PRIVILEGES ON *.* TO ${WORDPRESS_ADMIN_USER}@'%' IDENTIFIED BY '${WORDPRESS_ADMIN_PASSWORD}';\
	FLUSH PRIVILEGES;"

	echo "[RESET ROOT PASSWORD]\n"
	mysql -uroot -e "ALTER USER root@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"
	echo "[CREATE .root_pw_reset FILE]\n"
	touch /var/lib/mysql/.root_pw_reset
	echo "[SHUTDOWN MARIADB SERVER]\n"
	mysqladmin -uroot -p${MYSQL_ROOT_PASSWORD} shutdown
else
	if [ ! -e /run/mysqld ]; then
		echo "[CREATE /run/mysqld/mysqld.sock]\n"
		mkdir /run/mysqld && chmod 777 /run/mysqld && chown -R mysql:mysql /run/mysqld
	fi
fi

echo "[MYSQLD START]\n"
mysqld --user=mysql
