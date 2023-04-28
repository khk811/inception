# debian 기반
FROM debian:bullseye

# php-fpm, php-mysql 설치
RUN apt-get -y update && \
	apt-get -y install php-fpm php-mysql curl mariadb-client

# wp-cli 설치 (w/curl)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# phar 파일이 제대로 있는지 확인?
RUN php wp-cli.phar --info

# phar 파일 권한 변경 및 위치변경
RUN chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# download wordpress
# RUN wp core download --locale=ko_KR --allow-root

# wp-config.php 생성
# RUN wp config create --dbname=wp_hyunkkim --dbuser=hyunkkim --dbpass=1234 --allow-root

# install wordpress
# RUN wp core install --url=${DOMAIN_NAME} --title=Example --admin_user=hyunkkim --admin_password=1234 --admin_email=info@example.com --allow-root

# copy script file (상대경로 기준은 dockerfile 기준)
COPY ./tools/wp_script.sh /var/www/html/
RUN chmod +x /var/www/html/wp_script.sh

# open wp-admin in browser
# CMD ["sudo", "-u", "hyunkkim", "-i", "wp", "admin"]
CMD ["sh", "wp_script.sh"]


