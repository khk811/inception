FROM debian:buster

RUN apt-get -y update && \
	apt-get -y install nginx \
						curl \
						sudo \
						wget \
						libnss3-tools

RUN mkdir -p /var/www/html/

COPY --chmod=777 ./tools/static-web/ /data/static-web
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

# WORKDIR /data/static-web

EXPOSE 8001

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

