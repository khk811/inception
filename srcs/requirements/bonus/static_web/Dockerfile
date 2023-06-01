FROM debian:buster

RUN apt-get -y update && \
	apt-get -y install nginx \
						curl \
						sudo \
						wget \
						libnss3-tools

COPY ./tools/static-web/ /tmp
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8001

# CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

