#!/bin/bash

cp -r /usr/share/adminer/ /var/www/html/

chown -R www-data:www-data /var/www/html/adminer
chmod 755 /var/www/html/adminer

cd /var/www/html/adminer

mv adminer.php index.php

php -S 0.0.0.0:$ADMINER_PORT