#!/bin/bash

cd /var/www/html

chown -R www-data:www-data /var/www

if [ ! -e /var/www/html/.is_wp_installed ]; then
	echo "Download wordpress\n";
	sudo -u www-data sh -c "
	wp core download --locale=ko_KR"

	sudo -u www-data sh -c "
	cp wp-config-sample.php wp-config.php && \
	wp config set DB_NAME ${MYSQL_DATABASE} && \
	wp config set DB_USER ${MYSQL_USER} && \
	wp config set DB_HOST ${WORDPRESS_DB_HOST} && \
	wp config set DB_PASSWORD ${MYSQL_PASSWORD}"

	echo 'install wordpress\n' && \
	sudo -u www-data sh -c "
	wp core install \
	--url=${WORDPRESS_WEBSITE_URL} \
	--title=${WORDPRESS_WEBSITE_TITLE} \
	--admin_user=${WORDPRESS_ADMIN_USER} \
	--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
	--admin_email=${WORDPRESS_ADMIN_EMAIL}"

	touch /var/www/html/.is_wp_installed
fi

exec /usr/sbin/php-fpm7.4 -F
