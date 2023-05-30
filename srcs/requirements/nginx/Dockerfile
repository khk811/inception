# debian 기반
FROM debian:buster

# nginx 설치
RUN apt-get -y update && \
	apt-get -y install nginx \
		curl \
		sudo \
		wget \
		libnss3-tools

# HTTPS 인증서 스크립티 복사 및 실행
COPY ./tools/mkcert_script.sh /tmp/mkcert_script.sh
RUN /bin/sh /tmp/mkcert_script.sh

# Nginx 설정파일 복사
COPY ./conf/default /etc/nginx/conf.d/default.conf

# 443 port 열기
EXPOSE 443/tcp

# nginx 실행
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

