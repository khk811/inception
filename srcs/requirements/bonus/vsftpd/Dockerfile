# debian 기반
FROM debian:bullseye

# install vsftpd
RUN apt-get -y update && \
	apt-get -y install vsftpd

# RUN usermod -u 1000 ftp
# RUN groupmod -g 1000 ftp

COPY --chmod=777 /conf/custom_vsftpd.conf /etc/vsftpd.conf
COPY --chmod=777 /tool/ftp_script.sh /tmp/ftp_script.sh

# RUN mkdir -p /home/vsftpd && chown -R ftp:ftp /home/vsftpd/

EXPOSE 20 21

CMD ["/bin/sh", "/tmp/ftp_script.sh"]

# CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
