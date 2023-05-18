# debian 기반?
FROM debian:bullseye

# nginx 설치
RUN apt-get -y upgrade && \ 
apt-get -y update && \
apt-get -y install nginx \
		curl \
		sudo \
		wget \
		libnss3-tools

COPY ./tools/mkcert_script.sh /tmp/mkcert_script.sh

RUN /bin/sh /tmp/mkcert_script.sh

# config file? - copy config file
# COPY ./conf/default /etc/nginx/sites-available/default.conf
COPY ./conf/default /etc/nginx/conf.d/default.conf
# COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# 443 port 열기
EXPOSE 443/tcp

# 실행?
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

