FROM debian:bullseye

RUN apt update && \
    apt install adminer -y

COPY ./tools/docker-entrypoint.sh ./docker-entrypoint.sh

RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]