#!/bin/sh

service mariadb start

chmod -R 777 /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

# 유저가 두 명 필요하다. (그 중 한명은 관리자여야 한다.)
mysql -e "CREATE DATABASE IF NOT EXISTS wp_hyunkkim;\
CREATE USER IF NOT EXISTS hyunkkim@'%' IDENTIFIED BY '1234';\
GRANT ALL PRIVILEGES ON wp_hyunkkim.* TO hyunkkim@'%' IDENTIFIED BY '1234';\
FLUSH PRIVILEGES;"
echo "------DB CREATE DONE----------\n"

####### jisokang's tip
# mysql -e "CREATE DATABASE IF NOT EXISTS wp_hyunkkim;\
# CREATE USER IF NOT EXISTS hyunkkim@'%' IDENTIFIED BY '1234';\
# grant all privileges on wp_hyunkkim.* to hyunkkim@'%';\
# flush privileges;"

# echo "------CHECK DB STATUS----------\n"
# service mariadb status
echo "------RESET ROOT PASSWORD----------\n"
mysql -uroot -e "ALTER USER root@localhost IDENTIFIED BY 'r1234'; FLUSH PRIVILEGES;"
# echo "------CHECK DB STATUS----------\n"
# mysqladmin -uroot -pr1234 status
echo "------SHUTDOWN----------\n"
mysqladmin -uroot -pr1234 shutdown
# mysqladmin shutdown

echo "------MYSQLD----------\n"
exec mysqld --user=root

