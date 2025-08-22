FROM debian:bullseye

ENV WP_FILES_DIR="/var/www/html/wordpress"
ENV PHP_VERSION="7.4"
ENV WP_CLI_URL="https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"

RUN apt update && \
    apt install php${PHP_VERSION}-fpm php-mysql -y && \
    apt install curl -y && curl -O ${WP_CLI_URL}

RUN chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    mkdir /run/php/

COPY ./tools/docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x docker-entrypoint.sh

COPY ./conf/www.conf /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf

WORKDIR ${WP_FILES_DIR}

ENTRYPOINT ["/docker-entrypoint.sh" ]