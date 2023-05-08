#!/bin/sh

chmod -R 777 /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql


touch /tmp/mysql.sock
chmod 777 /tmp/mysql.sock

# ln -s /tmp/mysql.sock /var/mysql/mysql.sock

# sudo ufw allow 3306
# nmap localhost

sudo service mariadb status
sudo service mariadb start
sudo service mariadb status

# mysql -e "CREATE DATABASE $MYSQL_DATABASE IF NOT EXISTS"

mysqladmin -u $MYSQL_USER -p $MYSQL_PASSWORD

mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE DATABASE $MYSQL_DATABASE IF NOT EXISTS; \
grant all privileges $MYSQL_DATABASE.* to $MYSQL_USER@'%' identified by $MYSQL_PASSWORD;\
flush privileges;"

# mysqld --user=root
