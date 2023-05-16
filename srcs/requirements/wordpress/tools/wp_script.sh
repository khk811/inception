#!/bin/bash

# Wordpress download : 만약 index.php가 없는 상태라면 다운로드 함

cd /var/www/html

chown -R www-data:www-data /var/www

if [ ! -e index.php ]
then
	echo "Download wordpress\n";
	sudo -u www-data sh -c "
	wp core download --locale=ko_KR"
fi

if [ -e wp-config-sample.php -a ! -e wp-config.php ]
then
	sudo -u www-data sh -c "
	cp wp-config-sample.php wp-config.php && \
	wp config set DB_NAME ${MYSQL_DATABASE} && \
	wp config set DB_USER ${MYSQL_USER} && \
	wp config set DB_HOST ${WORDPRESS_DB_HOST} && \
	wp config set DB_PASSWORD ${MYSQL_PASSWORD}"
fi

# 2023-05-16 18:30 이 윗 줄 까지 됨

# # wp-config.php 생성 (그리고 install?)
if [ -e wp-config.php ]
then
	echo 'install wordpress\n' && \
	sudo -u www-data sh -c "
	wp core install \
	--url=localhost \
	--title=Example \
	--admin_user=root \
	--admin_password=1234 \
	--admin_email=hyunkkim@student.42seoul.kr"
fi

# exec /bin/sh

# open wp-admin in browser
# echo "open wordpress admin in browser\n";
# wp admin --allow-root

exec /usr/sbin/php-fpm7.4 -F
