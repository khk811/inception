#!/bin/sh

cd /var/www/html

chown -R www-data:www-data /var/www

if [ ! -e /var/www/html/.wp_installed ]; then
	echo "[DOWNLOAD WORDPRESS]\n";
	sudo -u www-data sh -c "
	wp core download --locale=ko_KR"

	echo "\n[CONFIGURE WORDPRESS]\n";
	sudo -u www-data sh -c "
	wp config create \
	--dbname=${MYSQL_DATABASE} \
	--dbuser=${MYSQL_USER} \
	--dbpass=${MYSQL_PASSWORD} \
	--dbhost=${WORDPRESS_DB_HOST}" \

	echo "\n[REDIS CONFIGURATION FOR WORDPRESS]";
	sudo -u www-data sh -c "
	wp config set WP_REDIS_HOST ${REDIS_HOST} && \
	wp config set WP_REDIS_PORT ${REDIS_PORT}"

#	echo "\n[FTP SERVER CONFIGURATION FOR WORDPRESS]\n";
#	sudo -u www-data sh -c "
#	wp config set FTP_USER ${FTP_USER} && \
#	wp config set FTP_PASS ${FTP_PASS} && \
#	wp config set FS_METHOD ${FS_METHOD} && \
#	wp config set FTP_BASE ${FTP_BASE} && \
#	wp config set FTP_HOST ${FTP_HOST} && \
#	wp config set FTP_SSL ${FTP_SSL}"

	echo "\n[INSTALL WORDPRESS]\n";
	sudo -u www-data sh -c "
	wp core install --skip-email \
	--url=${WORDPRESS_WEBSITE_URL} \
	--title=${WORDPRESS_WEBSITE_TITLE} \
	--admin_user=${WORDPRESS_ADMIN_USER} \
	--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
	--admin_email=${WORDPRESS_ADMIN_EMAIL}"

	echo "\n[INSTALL REDIS PLUGIN IN WORDPRESS]\n";
	sudo -u www-data sh -c "
	wp plugin install redis-cache --activate && \
	wp redis enable"

	echo "\n[CREATE .wp_installed FILE]\n";
	touch /var/www/html/.wp_installed
fi

echo "[START PHP-FPM]\n";
exec /usr/sbin/php-fpm7.3 -F
