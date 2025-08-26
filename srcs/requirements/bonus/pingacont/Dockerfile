FROM debian:bullseye

RUN apt update && \
    apt install curl -y && \
    apt install npm -y && \
    apt install iputils-ping -y

COPY ./tools/docker-entrypoint.sh /docker-entrypoint.sh

COPY ./server /server

WORKDIR /server

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]