#!/bin/bash

FTP_USR_PWD=$(tail -1 $FTP_SECRETS_FILE_TARGET)

if [ ! -f /etc/vsftpd.userlist ]; then
    echo "$FTP_USER:$FTP_USR_PWD" | chpasswd
    echo "${FTP_USER}" >> /etc/vsftpd.userlist
    chmod -R 775 $FTP_FILES_DIR
fi

vsftpd