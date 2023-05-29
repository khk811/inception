#!/bin/sh

cd ../ 

pwd | xargs echo

ls -la

if [ ! -e /var/www/html/inception/mkdocs.yml ]; then
	mkdocs new inception
else
	echo "/var/www/html/inception/"
fi

cd inception

mkdocs build

mkdocs serve --dev-addr=0.0.0.0:8000
