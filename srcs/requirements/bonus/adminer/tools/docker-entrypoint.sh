#!/bin/bash

cp -r /usr/share/adminer/ /var/www/html/wordpress/

chown -R www-data:www-data /var/www/html/wordpress/adminer
chmod 775 /var/www/html/wordpress/adminer

php