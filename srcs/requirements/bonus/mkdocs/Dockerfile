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
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

RUN pip3 install mkdocs-material

EXPOSE 8000

CMD ["/bin/sh", "/tmp/mkdocs_script.sh"]

