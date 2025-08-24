#!bin/bash

PASS=$(cat $DB_PWD_FILE_TARGET)

ROOT_PASS=$(cat $DB_ROOT_PWD_FILE_TARGET)

service mariadb start
while ! mysqladmin ping --silent; do
    sleep 1
done

if [ ! -d /var/lib/mysql/wp ]; then

    mariadb -u root --verbose -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASS';CREATE DATABASE IF NOT EXISTS $DB_NAME;CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$PASS';GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%';FLUSH PRIVILEGES;"

fi

mysqladmin -uroot -p$ROOT_PASS shutdown

mariadbd