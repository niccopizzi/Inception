#!/bin/bash

DB_PASS=$(cat $DB_PWD_FILE_TARGET)
WP_ADMIN_NAME=$(awk 'NR==1' $WP_CREDENTIALS_FILE_TARGET)
WP_ADMIN_EMAIL=$(awk 'NR==2' $WP_CREDENTIALS_FILE_TARGET)
WP_ADMIN_PASS=$(awk 'NR==3' $WP_CREDENTIALS_FILE_TARGET)
WP_USER_NAME=$(awk 'NR==4' $WP_CREDENTIALS_FILE_TARGET)
WP_USER_EMAIL=$(awk 'NR==5' $WP_CREDENTIALS_FILE_TARGET)
WP_USER_PASS=$(awk 'NR==6' $WP_CREDENTIALS_FILE_TARGET)

if [ ! -f wp-config.php ]; then
    wp core download --allow-root

    wp core config --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbprefix=wp_ --allow-root

    wp core install --url=https://$DOMAIN/ --title=$WP_TITLE --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root

    wp user create $WP_USER_NAME $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --allow-root
    
    wp plugin install redis-cache --allow-root
    wp config set WP_REDIS_HOST "redis-$CONTAINER_NAME" --type=constant --allow-root
    wp config set WP_REDIS_PORT "$REDIS_PORT" --type=constant --allow-root

    chown -R www-data:www-data $WP_FILES_DIR
fi

php-fpm$PHP_VERSION -F