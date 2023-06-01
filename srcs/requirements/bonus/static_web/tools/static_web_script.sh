#!/bin/sh

if [ ! -e /data/static-web/index.html ]; then
	echo "COPY WEB FILE\n";
	mkdir -p /data
	cp -R /tmp/static-web /data/
	ls -la /data && ls -la /data/staic-web/
else
	echo "webpage already exists\n"
fi

exec /usr/sbin/nginx -g daemon off
