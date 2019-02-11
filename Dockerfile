FROM alpine:latest

RUN apk update && apk add wget supervisor
COPY supervisord.conf /etc

RUN wget --output-document=/bin/aircast-x86-64 https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/aircast-x86-64 && chmod +x /bin/aircast-x86-64

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]