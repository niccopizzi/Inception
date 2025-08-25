FROM debian:bullseye

ARG ADMINER_PORT

ENV ADMINER_PORT=${ADMINER_PORT}

RUN apt update && \
    apt install adminer -y && \
    apt install php php-mysql -y

COPY ./tools/docker-entrypoint.sh ./docker-entrypoint.sh

RUN chmod +x ./docker-entrypoint.sh

EXPOSE ${ADMINER_PORT}

ENTRYPOINT [ "/docker-entrypoint.sh" ]