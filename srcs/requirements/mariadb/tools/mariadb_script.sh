#!/bin/sh

chmod -R 777 /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql


# touch /tmp/mysql.sock
# chmod 777 /tmp/mysql.sock

# ln -s /tmp/mysql.sock /var/mysql/mysql.sock

# sudo ufw allow 3306
# nmap localhost

# sudo service mariadb status
service mariadb start
# sudo service mariadb status

# mysql -e "CREATE DATABASE $MYSQL_DATABASE IF NOT EXISTS"

# mysqladmin -u $MYSQL_USER -p $MYSQL_PASSWORD

# mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;\
# grant all privileges on $MYSQL_DATABASE.* to $MYSQL_USER@'%' identified by '$MYSQL_PASSWORD';\
# flush privileges;"

# 유저가 두 명 필요하다. (그 중 한명은 관리자여야 한다.)
# mysql -e "CREATE DATABASE IF NOT EXISTS wp_hyunkkim;\
# grant all privileges on wp_hyunkkim.* to hyunkkim@'%' identified by '1234';\
# flush privileges;"

####### jisokang's tip
mysql -e "CREATE DATABASE IF NOT EXISTS wp_hyunkkim;\
CREATE USER IF NOT EXISTS 'hyunkkim'@'%' IDENTIFIED BY '1234';\
grant all privileges on wp_hyunkkim.* to 'hyunkkim'@'%';\
flush privileges;"
echo "------DB CREATE DONE----------\n"

# echo "------RESET ROOT PASSWORD----------\n"
# mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'r1234';\
# FLUSH PRIVILEGES;"

# mysqladmin -u root shutdown

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'r1234'";
# mysqladmin --user=root --password= password "r1234"
echo "------SHUTDOWN----------\n"
mysql wp_hyunkkim -uroot -pr1234
mysqladmin -uroot -pr1234 shutdown
# echo "------MYSQLD----------\n"
exec mysqld --console

# WP 붙이기!!!
