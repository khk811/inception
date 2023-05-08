FROM debian:bullseye

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install mariadb-server

EXPOSE 3306

COPY /conf/my.cnf /etc/mysql/my.cnf
COPY --chmod=777 /tools/mariadb_script.sh /tmp/mariadb_script.sh

# RUN groupadd -r mysql
# RUN useradd -r -g mysql mysql

CMD ["/bin/sh", "/tmp/mariadb_script.sh"]
