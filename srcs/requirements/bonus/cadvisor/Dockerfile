FROM debian:buster

RUN apt-get update -y && \
	apt-get install -y curl

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.37.4/cadvisor -o /usr/bin/cadvisor && \
	chmod +x /usr/bin/cadvisor

EXPOSE 2000

CMD ["cadvisor", "-logtostderr", "--port=2000"]
