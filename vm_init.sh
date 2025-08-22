#!/bin/bash

echo "npizzi.42.fr" > /etc/hostname
echo "npizzi.42.fr" >> /etc/hosts

mkdir /home/npizzi/data
mkdir /home/npizzi/data/db
mkdir /home/npizzi/data/wordpress
openssl genrsa -des3 -out npizzi.key 4096
openssl req -new -key npizzi.key -out npizzi.csr
cp npizzi.key npizzi.key.pwd
openssl rsa -in npizzi.key.pwd -out npizzi.key
openssl x509 -req -in npizzi.csr -signkey npizzi.key -out npizzi.crt
mkdir /etc/nginx/ssl
cp npizzi.key /etc/nginx/ssl/npizzi.key
cp npizzi.crt /etc/nginx/ssl/npizzi.crt