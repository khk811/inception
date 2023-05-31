#!/bin/sh

if [ ! -e /data/adminer.php ]; then
	echo "[INSTALL ADMINER]\n";
	wget "http://www.adminer.org/latest.php" -O /data/adminer.php && \
	chown -R www-data:www-data /data/adminer.php && \
 	chmod 755 /data/adminer.php
else
	echo ">> ADMINER ALREADY EXISTS\n";
fi

echo "[START PHP-FPM]\n";
exec /usr/sbin/php-fpm7.4 -F
