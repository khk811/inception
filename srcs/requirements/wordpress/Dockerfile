# debian 기반
FROM debian:bullseye

# php-fpm, php-mysql 설치
RUN apt-get -y update && \
	apt-get -y install php-fpm \
			php-mysql \
			curl \
			sudo \
			mariadb-client

# wp-cli 설치 (w/curl)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# phar 파일 권한 변경 및 위치변경
RUN chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	mkdir -p /run/php

# copy script file (상대경로 기준은 dockerfile 기준)
COPY --chmod=777 /tools/wp_script.sh /tmp/wp_script.sh
COPY --chmod=777 /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

# open wp-admin in browser
CMD ["/bin/sh", "/tmp/wp_script.sh"]

