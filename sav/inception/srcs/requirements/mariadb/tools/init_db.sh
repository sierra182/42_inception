#!/bin/bash
# echo lolo 0
# mysqld_safe --datadir="/var/lib/mysql" &
# echo lili 1
# sleep 10
# echo dodo 2
# mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "CREATE USER IF NOT EXISTS \`$(cat ${MYSQL_USER_FILE})\`@'%' IDENTIFIED BY '$(cat ${MYSQL_PASSWORD_FILE})';"

# mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`$(cat ${MYSQL_USER_FILE})\`@'%';"

# mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat ${MYSQL_ROOT_PASSWORD_FILE})';"

# mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "FLUSH PRIVILEGES;"
# echo cho 3 
# mysqladmin -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) shutdown
# echo lolo 4

# # Relance MariaDB en mode sûr pour rester en exécution
# exec mysqld_safe

# echo lolo 5
# mysqld_safe --datadir="/var/lib/mysql" &

echo "Start init Mariadb"
service --status-all
service mariadb start

# mysqld_safe &

# until mysqladmin ping --silent; do
#   echo "Waiting for MariaDB to be ready..."
#   sleep 2
# done

echo "MariaDB is ready, configuring the database..."


# Démarre MariaDB en mode sûr sans utiliser '&'
# mysqld --datadir="/var/lib/mysql" --socket=/run/mysqld/mysqld.sock

# service mysqld_safe --datadir="/var/lib/mysql" start
# systemctl start mysqld
# service --status-all
# sleep 10
# sleep 15
# echo "dodo 2"
# sleep 15
# Exécute les commandes SQL une fois que MariaDB est prêt
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "CREATE USER IF NOT EXISTS \`$(cat ${MYSQL_USER_FILE})\`@'%' IDENTIFIED BY '$(cat ${MYSQL_PASSWORD_FILE})';"
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`$(cat ${MYSQL_USER_FILE})\`@'%';"
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat ${MYSQL_ROOT_PASSWORD_FILE})';"
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "FLUSH PRIVILEGES;"

echo "Database configured successfully!"
# sleep 15
sudo mysqladmin -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) shutdown

# sleep 15
echo before stop
# service --status-all
# sleep 10
# export MYSQL_PWD="super_secure_password"
# mysqladmin -u root shutdown

# mysqladmin -u root -p"my_password" shutdown
# mysql -u root -psuper_secure_password -e "SHOW DATABASES;"
# service mariadb stop
# echo after stop
# until !mysqladmin ping >/dev/null 2>&1; do
#   echo "Waiting for MariaDB to be stopped..."
#   sleep 2
# done

exec mysqld_safe 
