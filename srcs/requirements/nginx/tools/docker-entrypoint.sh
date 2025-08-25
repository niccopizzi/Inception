#! /bin/bash

set -eu

if [ -f /etc/nginx/conf.d/default.conf.template ]; then
    envsubst '${NGINX_PORT} ${DOMAIN} ${NGINX_CERT_FILE} ${NGINX_KEY_FILE} ${$WP_FILES_DIR} ${WP_HOST} ${WEBSITE_NAME}' \
            < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
    rm /etc/nginx/conf.d/default.conf.template
fi

nginx -g 'daemon off;'