# debian 기반
FROM debian:bullseye

# Redis prerequisite (docker container?)
RUN apt-get -y update && \
	apt-get -y install lsb-release \
						curl \
						gpg \
						sudo

# apt index에 repository 추가
RUN curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

# redis 설치
RUN apt-get -y install redis

EXPOSE 6379

CMD ["redis-server", "--daemonize", "no"]
