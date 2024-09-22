#!/bin/bash

echo "Start init Mariadb"
service mariadb start
echo "MariaDB is ready, configuring the database..."

mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) \
	-e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) \
	-e "CREATE USER IF NOT EXISTS \`$(cat ${MYSQL_USER_FILE})\`@'%' \
	IDENTIFIED BY '$(cat ${MYSQL_PASSWORD_FILE})';"
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) \
	-e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* \
	TO \`$(cat ${MYSQL_USER_FILE})\`@'%';"
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) \
	-e "ALTER USER 'root'@'localhost' IDENTIFIED BY \
	'$(cat ${MYSQL_ROOT_PASSWORD_FILE})';"
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) \
	-e "FLUSH PRIVILEGES;"

echo "Database configured successfully!"
mysqladmin -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) shutdown

exec "$@" 