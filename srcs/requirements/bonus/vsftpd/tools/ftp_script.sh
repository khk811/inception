#!/bin/sh

echo "[TEST]\n";
echo "${FTP_USER} , ${FTP_PASS}"

echo "\n[ADD USER]\n";
useradd -m -s /bin/bash ${FTP_USER}

echo "\n[CHANGE USER PASSWORD]\n";
echo "${FTP_PASS}\n${FTP_PASS}" | passwd ${FTP_USER}

echo "\n[ADD USER TO THE GROUP]\n";
usermod -a -G www-data ${FTP_USER}

echo "\n[CHECK USER GROUP]\n";
groups ${FTP_USER}

echo "\n[CHANGE DIR PREVILEGE]\n";
mkdir -p /home/vsftpd && chown -R www-data:www-data /home/vsftpd
chmod -R 776 /home/vsftpd

ls -la /home/

echo "\n[RUN vsftpd]\n";
/usr/sbin/vsftpd /etc/vsftpd.conf
