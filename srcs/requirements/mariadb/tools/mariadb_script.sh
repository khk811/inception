#!/bin/sh


if [ ! -e /var/lib/mysql/.is_root_reset ]; then
	echo "------[ root_reset ] DB START----------\n"
	service mariadb start 2> /dev/null
	echo "------[ root_reset ] BEFORE CHMOD----------\n"
	chmod -R 777 /var/lib/mysql
	echo "------[ root_reset ] AFTER CHMOD----------\n"

	echo "------[ root_reset ] BEFORE CHOWN----------\n"
	chown -R mysql:mysql /var/lib/mysql
	echo "------[ root_reset ] AFTER CHOWN----------\n"

	echo "-------CREATE DB---------\n"

	mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};\
	CREATE USER IF NOT EXISTS ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';\
	GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';\
	FLUSH PRIVILEGES;"

	echo "-------CREATE EXTRA USER AND MAKE IT ROOT-AS---------\n"
	mysql -e "CREATE USER IF NOT EXISTS ${WORDPRESS_ADMIN_USER}@'%' IDENTIFIED BY '${WORDPRESS_ADMIN_PASSWORD}';\
	GRANT ALL PRIVILEGES ON *.* TO ${WORDPRESS_ADMIN_USER}@'%' IDENTIFIED BY '${WORDPRESS_ADMIN_PASSWORD}';\
	FLUSH PRIVILEGES;"

	echo "-------RESET ROOT PASSWORD---------\n"
	mysql -uroot -e "ALTER USER root@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"
	echo "-------MAKE .is_root_reset---------\n"
	touch /var/lib/mysql/.is_root_reset
	echo "-------[root reset] SHUTDOWN ---------\n"
	mysqladmin -uroot -p${MYSQL_ROOT_PASSWORD} shutdown
	echo "-------[root reset] SHUTDOWN COMPLETE---------\n"
else
	if [ ! -e /run/mysqld ]; then
		mkdir /run/mysqld && chmod 777 /run/mysqld && chown -R mysql:mysql /run/mysqld
	fi
fi

echo "------MYSQLD START----------\n"
mysqld --user=mysql

# echo "------AFTER SHUTDOWN----------\n"
# exec mysqld --user=mysql

# service mariadb start

# chmod -R 777 /var/lib/mysql
# chown -R mysql:mysql /var/lib/mysql

# 유저가 두 명 필요하다. (그 중 한명은 관리자여야 한다.)
# mysql -e "CREATE DATABASE IF NOT EXISTS wp_hyunkkim;\
# CREATE USER IF NOT EXISTS hyunkkim@'%' IDENTIFIED BY '1234';\
# GRANT ALL PRIVILEGES ON wp_hyunkkim.* TO hyunkkim@'%' IDENTIFIED BY '1234';\
# FLUSH PRIVILEGES;"

# echo "------DB CREATE DONE----------\n"

####### jisokang's tip
# mysql -e "CREATE DATABASE IF NOT EXISTS wp_hyunkkim;\
# CREATE USER IF NOT EXISTS hyunkkim@'%' IDENTIFIED BY '1234';\
# grant all privileges on wp_hyunkkim.* to hyunkkim@'%';\
# flush privileges;"

# echo "------RESET ROOT PASSWORD----------\n"
# mysql -uroot -e "ALTER USER root@localhost IDENTIFIED BY '1234'; FLUSH PRIVILEGES;"

# echo "------CHECK DB STATUS----------\n"
# mysqladmin -uroot -pr1234 status

# echo "------SHUTDOWN----------\n"
# mysqladmin -uroot -p1234 shutdown

# echo "------MYSQLD----------\n"
# exec mysqld --user=mysql

