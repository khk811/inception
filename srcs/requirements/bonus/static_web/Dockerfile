FROM debian:buster

RUN apt-get -y update && \
	apt-get -y install nginx \
						curl \
						sudo \
						wget \
						libnss3-tools

# COPY ./tools/mkcert_scr  ipt.sh /tmp/mkcert_script.sh
RUN mkdir -p /var/www/html/
COPY --chmod=777 ./tools/static-web/ /var/www/html/static-web
# COPY --chmod=777 ./tools/static_web_sciprt.sh /tmp/static_web_sciprt.sh
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

# WORKDIR /var/www/html/static-web

EXPOSE 8001
# EXPOSE 443/tcp

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

