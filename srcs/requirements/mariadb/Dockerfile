FROM debian:bullseye

RUN apt update && \
    apt install mariadb-server -y

COPY ./tools/docker-entrypoint.sh docker-entrypoint.sh

RUN chmod +x docker-entrypoint.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["/docker-entrypoint.sh" ]