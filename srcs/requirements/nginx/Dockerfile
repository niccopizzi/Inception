FROM debian:bullseye

RUN apt update && \
    apt install nginx -y && \
    apt install gettext -y

COPY ./conf/nginx.conf.template /etc/nginx/conf.d/default.conf.template

COPY ./tools/docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x docker-entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/docker-entrypoint.sh"]
