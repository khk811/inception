# debian 기반
FROM debian:bullseye

# mariadb 설치
RUN apt-get -y update && \
	apt-get -y install mariadb-server

# Mariadb 설정파일 복사
COPY /conf/my.cnf /etc/mysql/my.cnf

# mariadb_script.sh 스크립트 복사
COPY --chmod=777 /tools/mariadb_script.sh /tmp/mariadb_script.sh

# 3306 port 열기
EXPOSE 3306

# mariadb_script.sh 실행
CMD ["/bin/sh", "/tmp/mariadb_script.sh"]
