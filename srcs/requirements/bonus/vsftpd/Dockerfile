# debian 기반
FROM debian:buster

# install vsftpd
RUN apt-get -y update && \
	apt-get -y install vsftpd

COPY --chmod=777 /conf/test.conf /etc/vsftpd.conf
COPY --chmod=777 /tools/ftp_script.sh /tmp/ftp_script.sh
RUN touch /var/log/vsftpd.log


EXPOSE 20 21 30001

CMD ["/bin/sh", "/tmp/ftp_script.sh"]
