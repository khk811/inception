# debian 기반
FROM debian:buster

RUN apt-get -y update && \
	apt-get -y install lsb-release \
			   wget \
			   apt-transport-https \
			   ca-certificates && \
	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
	echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

# php-fpm, php-mysql 설치
RUN apt-get -y update && \
	apt-get -y install php7.4-fpm \
						php7.4-mysql \
						php7.4-cli \
						php7.4-curl \
						mariadb-client \
						sudo

# wp-cli 설치 (w/curl)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# phar 파일 권한 변경 및 위치변경
RUN chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	mkdir -p /run/php

# copy script file (상대경로 기준은 dockerfile 기준)
COPY --chmod=777 /tools/wp_script.sh /tmp/wp_script.sh
COPY --chmod=777 /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# 9000 port 열기
EXPOSE 9000

# wp_script.sh 실행
CMD ["/bin/sh", "/tmp/wp_script.sh"]

