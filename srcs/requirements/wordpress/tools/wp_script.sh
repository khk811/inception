#!/bin/sh

cd /var/www/html

chown -R www-data:www-data /var/www

if [ ! -e /var/www/html/.wp_installed ]; then
	echo "[DOWNLOAD WORDPRESS]\n";
	sudo -u www-data sh -c "
	wp core download --locale=ko_KR"

	echo "[CONFIGURE WORDPRESS]\n";
	sudo -u www-data sh -c "
	wp config create \
	--dbname=${MYSQL_DATABASE} \
	--dbuser=${MYSQL_USER} \
	--dbpass=${MYSQL_PASSWORD} \
	--dbhost=${WORDPRESS_DB_HOST}" \

	echo "[INSTALL WORDPRESS]\n";
	sudo -u www-data sh -c "
	wp core install --skip-email \
	--url=${WORDPRESS_WEBSITE_URL} \
	--title=${WORDPRESS_WEBSITE_TITLE} \
	--admin_user=${WORDPRESS_ADMIN_USER} \
	--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
	--admin_email=${WORDPRESS_ADMIN_EMAIL}"

	echo "[CREATE .wp_installed FILE]\n";
	touch /var/www/html/.wp_installed
fi

echo "[START PHP-FPM]\n";
exec /usr/sbin/php-fpm7.4 -F
