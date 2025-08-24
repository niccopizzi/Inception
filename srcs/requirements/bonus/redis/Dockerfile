FROM debian:bullseye

ARG REDIS_PORT

RUN apt update && \
    apt install redis -y && \
    apt install gettext -y

COPY ./conf/redis.conf /etc/redis/redis.conf.template

RUN envsubst '${REDIS_PORT}' < /etc/redis/redis.conf.template > /etc/redis/redis.conf.template && \
    rm /etc/redis/redis.conf.template

ENTRYPOINT ["redis-server", "--protected-mode", "no"]