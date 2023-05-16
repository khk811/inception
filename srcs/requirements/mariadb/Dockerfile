FROM debian:bullseye

RUN apt-get -y update && \
	apt-get -y install mariadb-server

EXPOSE 3306

COPY /conf/my.cnf /etc/mysql/my.cnf
COPY --chmod=777 /tools/mariadb_script.sh /tmp/mariadb_script.sh

CMD ["/bin/sh", "/tmp/mariadb_script.sh"]
# ENTRYPOINT ["/bin/sh", "/tmp/mariadb_script.sh"]
