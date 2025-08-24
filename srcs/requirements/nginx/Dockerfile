FROM debian:bullseye

ARG NGINX_PORT

ENV NGINX_PORT=${NGINX_PORT}

RUN apt update && \
    apt install nginx -y && \
    apt install gettext -y && \
    apt install iputils-ping -y

COPY ./conf/nginx.conf.template /etc/nginx/conf.d/default.conf.template

COPY ./tools/docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x docker-entrypoint.sh

EXPOSE ${NGINX_PORT}

ENTRYPOINT ["/docker-entrypoint.sh"]
