# debian 10
FROM debian:buster

# install adminer
RUN apt-get -y update && \
	apt-get -y install php-fpm \
						php-mysql \
						wget


RUN mkdir -p /run/php

COPY --chmod=777 /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY --chmod=777 /tools/adminer_script.sh /tmp/adminer_script.sh

EXPOSE 8080

CMD ["/bin/bash", "/tmp/adminer_script.sh"]
