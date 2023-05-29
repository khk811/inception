FROM debian:bullseye

RUN apt-get -y update && \
	apt-get -y install python3 \
						python3-pip \
						mkdocs

RUN mkdir -p /var/www/html && \
	cd /var/www/html && \
	mkdocs new inception && \
	cd inception

RUN pip3 install mkdocs-material

EXPOSE 4242

CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:4242"]
