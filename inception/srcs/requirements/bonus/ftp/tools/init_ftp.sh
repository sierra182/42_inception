#!/bin/bash

# useradd -g www-data -d /var/www/wordpress -s /bin/bash $FTP_USER
# echo "$FTP_USER:$FTP_PASS" | chpasswd

useradd -g www-data -d /var/www/wordpress -s /bin/bash ftpuser
echo "ftpuser:password" | chpasswd

exec "$@"
