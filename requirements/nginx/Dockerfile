# debian 기반?
FROM debian:bullseye

# nginx 설치
RUN apt-get -y update && apt-get -y install nginx

# config file? - copy config file
COPY ./conf/default /etc/nginx/sites-available/default

# 443 port 열기
EXPOSE 443/tcp

# 실행?
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

