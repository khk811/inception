# debian 기반
FROM debian:bullseye

# install vsftpd
RUN apt-get -y update && \
	apt-get -y install vsftpd

RUN usermod -u 1000 ftp
RUN groupmod -g 1000 ftp

COPY --chmod=777 /conf/custom_vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /home/vsftpd && chwon -R ftp:ftp /home/vsftpd/

EXPOSE 20 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
