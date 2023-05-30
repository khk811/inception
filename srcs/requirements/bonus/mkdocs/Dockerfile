FROM debian:buster

RUN apt-get -y update && \
	apt-get -y install python3 \
						python3-pip \
						mkdocs \
						nginx \
						curl \
						sudo \
						wget \
						libnss3-tools

COPY --chmod=777 /tools/mkdocs_script.sh /tmp/mkdocs_script.sh
# COPY ./tools/mkcert_script.sh /tmp/mkcert_script.sh
COPY ./conf/default /etc/nginx/conf.d/default.conf

RUN pip3 install mkdocs-material

# RUN /bin/sh /tmp/mkcert_script.sh

# WORKDIR /var/www/html/inception

EXPOSE 8000
# EXPOSE 443/tcp

CMD ["/bin/sh", "/tmp/mkdocs_script.sh"]
# CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

