#!/bin/bash

# Wordpress download : 만약 index.php가 없는 상태라면 다운로드 함

cd /var/www/html

if [ ! -e index.php ]
then
	echo "Download wordpress\n";
	wp core download --locale=ko_KR --allow-root
fi

if [ -e wp-config-sample.php -a ! -e wp-config.php ]
then
	cp wp-config-sample.php wp-config.php && \
	wp config set DB_NAME ${MYSQL_DATABASE} --allow-root && \
	wp config set DB_USER ${MYSQL_USER} --allow-root && \
	wp config set DB_HOST ${WORDPRESS_DB_HOST} --allow-root && \
	wp config set DB_PASSWORD ${MYSQL_PASSWORD} --allow-root
fi

# 2023-05-16 18:30 이 윗 줄 까지 됨

# # wp-config.php 생성 (그리고 install?)
if [ -e wp-config.php ]
then
	echo 'install wordpress\n' && \
	wp core install \
	--url=${DOMAIN_NAME} \
	--title=Example \
	--admin_user=hyunkkim \
	--admin_password=1234 \
	--admin_email=hyunkkim@student.42seoul.kr --allow-root
fi

# exec /bin/sh

# open wp-admin in browser
echo "open wordpress admin in browser\n";
wp admin --allow-root
