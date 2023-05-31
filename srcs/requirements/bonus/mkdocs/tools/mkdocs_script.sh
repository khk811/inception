#!/bin/sh

cd /data

pwd | xargs echo

ls -la

if [ ! -e /data/inception/mkdocs.yml ]; then
	echo "\n[CREATE NEW MKDOCS DIR]\n"
	mkdocs new inception
else
	echo "\n >> MKDOCS DIR ALREADY EXISTS \n";
fi

cd /data/inception

mkdocs build

/usr/sbin/nginx -g "daemon off;"
