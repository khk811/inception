FROM debian:bullseye

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install mariadb-server \
						sudo \
						ufw \
						nmap

EXPOSE 3306

COPY /conf/my.cnf /etc/mysql/my.cnf
COPY --chmod=777 /tools/mariadb_script.sh /tmp/mariadb_script.sh

# RUN groupadd -r mysql
# RUN useradd -r -g mysql mysql

# RUN ln -s /tmp/mysql.sock /var/lib/mysql/mysql.sock

# RUN service mariadb start

CMD ["/bin/sh", "/tmp/mariadb_script.sh"]
# ENTRYPOINT ["/bin/sh", "/tmp/mariadb_script.sh"]
