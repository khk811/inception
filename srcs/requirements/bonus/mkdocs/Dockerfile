FROM debian:bullseye

RUN apt-get -y update && \
	apt-get -y install python3 \
						python3-pip \
						mkdocs

COPY --chmod=777 /tools/mkdocs_script.sh /tmp/mkdocs_script.sh

RUN pip3 install mkdocs-material

EXPOSE 8000

CMD ["/bin/sh", "/tmp/mkdocs_script.sh"]
