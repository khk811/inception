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

ls -la /home/

chmod -R 775 /home/vsftpd

echo "\n[CREATE SECURE CHROOT PATH]\n";
mkdir -p /var/run/vsftpd/empty

echo "\n[ADD USER IN vsftpd USER LIST]\n";
touch /etc/vsftpd.userlist
echo ${FTP_USER} | tee -a /etc/vsftpd.userlist

echo "\n[RUN vsftpd]\n";
exec /usr/sbin/vsftpd /etc/vsftpd.conf
