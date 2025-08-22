#!/bin/bash

DB_PASS=$(cat /run/secrets/db_password.txt)
WP_ADMIN_EMAL=$(awk 'NR==1' /run/secrets/wp_credentials.txt)
WP_ADMIN_PASS=$(awk 'NR==2' /run/secrets/wp_credentials.txt)
WP_USER_EMAIL=$(awk 'NR==3' /run/secrets/wp_credentials.txt)
WP_USER_PASS=$(awk 'NR==4' /run/secrets/wp_credentials.txt)

if [ ! -f wp-config.php ]; then
    wp core download --allow-root

    wp core config --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbprefix=wp_ --allow-root

    wp core install --url=https://$DOMAIN/ --title=$WP_TITLE --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAL --allow-root

    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --allow-root

    chown -R www-data:www-data $WP_FILES_DIR
fi

php-fpm$PHP_VERSION -F