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

echo "lolo 042"
mysqld_safe --datadir="/var/lib/mysql" &
# Démarre MariaDB en mode sûr sans utiliser '&'
# mysqld --datadir="/var/lib/mysql" --socket=/run/mysqld/mysqld.sock

# service mysqld_safe --datadir="/var/lib/mysql" start
service mysql start
sleep 15
echo "dodo 2"

# Exécute les commandes SQL une fois que MariaDB est prêt
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "CREATE USER IF NOT EXISTS \`$(cat ${MYSQL_USER_FILE})\`@'%' IDENTIFIED BY '$(cat ${MYSQL_PASSWORD_FILE})';"
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`$(cat ${MYSQL_USER_FILE})\`@'%';"
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat ${MYSQL_ROOT_PASSWORD_FILE})';"
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "FLUSH PRIVILEGES;"

echo "cho 3"

# Arrête MariaDB après avoir exécuté les commandes SQL
mysqladmin -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) shutdown

echo "lolo 4"
# service mysqladmin stop
# Redémarre MariaDB en mode sûr et le laisse en exécution comme processus principal
exec mysqld_safe # --datadir="/var/lib/mysql"
