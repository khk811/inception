# debian 기반
FROM debian:bullseye

# php-fpm, php-mysql 설치
RUN apt-get -y update && \
	apt-get -y install php-fpm php-mysql curl

# wp-cli 설치 (w/curl)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# download wordpress
RUN wp core download --locale=ko_KR

# install wordpress
RUN wp core install --url=${DOMAIN_NAME} --title=Example --admin_user=hyunkkim --admin_password=1234 --admin_email=info@example.com

# open wp-admin in browser
CMD ["wp", "admin"]

