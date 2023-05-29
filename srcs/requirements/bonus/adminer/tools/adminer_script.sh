#!/bin/sh

if [ ! -e /var/www/html/adminer.php ]; then
	echo "[INSTALL ADMINER]\n";
	wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php && \
	chown -R www-data:www-data /var/www/html/adminer.php && \
 	chmod 755 /var/www/html/adminer.php
else
	echo ">> ADMINER ALREADY EXISTS\n";
fi

echo "[START PHP-FPM]\n";
exec /usr/sbin/php-fpm7.4 -F
