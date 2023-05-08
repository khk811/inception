#!/bin/bash

# Wordpress download : 만약 index.php가 없는 상태라면 다운로드 함
if [ ! -e index.php ]
then
	echo "Download wordpress\n";
	wp core download --locale=ko_KR --allow-root
fi

# wp-config.php 생성 (그리고 install?)
if [ ! -e wp-config.php ]
then
	sudo -u www-data sh -c "
	echo 'create config\n' && \
	wp config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --allow-root && \
	echo 'install wordpress\n' && \
	wp core install \
	--url=${DOMAIN_NAME} \
	--title=Example \
	--admin_user=hyunkkim \
	--admin_password=1234 \
	--admin_email=hyunkkim@student.42seoul.kr --allow-root
	"
fi

# exec /bin/sh

# open wp-admin in browser
echo "open wordpress admin in browser\n";
wp admin --allow-root
