#!/bin/sh


if [ ! -e /var/lib/mysql/.is_root_reset ]; then
	service mariadb start
	echo "------BEFORE CHMOD----------\n"
	chmod -R 777 /var/lib/mysql
	echo "------AFTER CHMOD----------\n"
	echo "------BEFORE CHOWN----------\n"
	chown -R mysql:mysql /var/lib/mysql
	echo "------AFTER CHOWN----------\n"

	echo "-------RESET ROOT PASSWORD---------\n"

	mysql -e "CREATE DATABASE IF NOT EXISTS wp_hyunkkim;\
	CREATE USER IF NOT EXISTS hyunkkim@'%' IDENTIFIED BY '1234';\
	GRANT ALL PRIVILEGES ON wp_hyunkkim.* TO hyunkkim@'%' IDENTIFIED BY '1234';\
	FLUSH PRIVILEGES;"

	mysql -uroot -e "ALTER USER root@localhost IDENTIFIED BY '1234'; FLUSH PRIVILEGES;"
	echo "-------RESET ROOT PASSWORD---------\n"
	touch /var/lib/mysql/.is_root_reset
	mysqladmin -uroot -p1234 shutdown
fi

echo "------BEFORE CHMOD----------\n"
chmod -R 777 /var/lib/mysql
echo "------AFTER CHMOD----------\n"
echo "------BEFORE CHOWN----------\n"
chown -R mysql:mysql /var/lib/mysql
echo "------AFTER CHOWN----------\n"

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

