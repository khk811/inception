# debian 10
FROM debian:buster

RUN apt-get -y update && \
	apt-get -y install lsb-release \
			   wget \
			   apt-transport-https \ 
			   ca-certificates && \
	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
	echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

# install adminer
RUN apt-get -y update && \
	apt-get -y install php7.4-fpm \
				php7.4-mysql


RUN mkdir -p /run/php

COPY --chmod=777 /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY --chmod=777 /tools/adminer_script.sh /tmp/adminer_script.sh

EXPOSE 8080

CMD ["/bin/bash", "/tmp/adminer_script.sh"]
