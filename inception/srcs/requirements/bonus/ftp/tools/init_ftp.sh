#!/bin/bash

useradd -g www-data -d /var/www/wordpress -s /bin/bash "$(cat $FTP_USER_FILE)"
echo "$(cat ${FTP_USER_FILE}):$(cat ${FTP_PASSWORD_FILE})" | chpasswd

exec "$@"
