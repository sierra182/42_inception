#!/bin/bash

# Démarre le serveur MariaDB
mysqld_safe --datadir="/var/lib/mysql" &

# Attendre que MariaDB soit prêt
sleep 10

# Crée la base de données
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# Crée l'utilisateur et lui donne les droits
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "CREATE USER IF NOT EXISTS \`$(cat ${MYSQL_USER_FILE})\`@'%' IDENTIFIED BY '$(cat ${MYSQL_PASSWORD_FILE})';"

mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`$(cat ${MYSQL_USER_FILE})\`@'%';"

# Modifie le mot de passe de l'utilisateur root
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat ${MYSQL_ROOT_PASSWORD_FILE})';"

# Applique les changements
mysql -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) -e "FLUSH PRIVILEGES;"

# Arrête MariaDB proprement
mysqladmin -u root -p$(cat ${MYSQL_ROOT_PASSWORD_FILE}) shutdown

# Relance MariaDB en mode sûr pour rester en exécution
exec mysqld_safe

