# debian 11
FROM debian:bullseye

# install adminer
RUN apt-get -y update && \
	apt-get -y install php-fpm \
						php-mysql \
						wget


RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php

RUN chown -R www-data:www-data /var/www/html/adminer.php && \
 	chmod 755 /var/www/html/adminer.php && \
	mkdir -p /run/php

COPY --chmod=777 /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 8080

CMD ["/usr/sbin/php-fpm7.4", "-F"]
