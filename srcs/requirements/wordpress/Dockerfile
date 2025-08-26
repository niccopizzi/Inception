FROM debian:bullseye

ARG WP_FILES_DIR
ARG PHP_VERSION
ARG WP_CLI_URL

RUN apt update && \
    apt install php${PHP_VERSION}-fpm php-mysql -y && \
    apt install curl -y && curl -O ${WP_CLI_URL} && \
    apt install iputils-ping -y && \
    apt install libfcgi-bin -y

RUN chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    mkdir /run/php/

COPY ./tools/docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x docker-entrypoint.sh

COPY ./conf/www.conf /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf

WORKDIR ${WP_FILES_DIR}

ENTRYPOINT ["/docker-entrypoint.sh" ]