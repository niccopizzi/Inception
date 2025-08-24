FROM debian:bullseye

ARG FTP_USER
ARG FTP_USER_HOME_DIR
ARG FTP_FILES_DIR
ARG FTP_PORT

ENV FTP_USER=${FTP_USER}
ENV FTP_FILES_DIR=${FTP_FILES_DIR}

RUN apt update && \
    apt install vsftpd -y
    
COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/docker-entrypoint.sh ./docker-entrypoint.sh

RUN chmod +x ./docker-entrypoint.sh && \
    useradd --create-home --shell /bin/bash ${FTP_USER} && \
    usermod -aG www-data ${FTP_USER} && \
    chown www-data:100000  ${FTP_USER_HOME_DIR} && \
    chmod a-w ${FTP_USER_HOME_DIR} && \
    mkdir /var/run/vsftpd /var/run/vsftpd/empty

EXPOSE ${FTP_PORT}

ENTRYPOINT ["./docker-entrypoint.sh"]