# debian 11
FROM debian:bullseye

# install adminer
RUN apt-get -y update && \
	apt-get -y install php-fpm \
						php-mysql \
						adminer

RUN mkdir -p /run/php

COPY --chmod=777 /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 8080

CMD ["/usr/sbin/php-fpm7.4", "-F"]
