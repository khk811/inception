# debian 기반
FROM debian:bullseye

# install vsftpd
RUN apt-get -y update && \
	apt-get -y install vsftpd

EXPOSE 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
