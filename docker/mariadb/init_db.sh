#!/bin/bash

# Démarre le serveur MariaDB
mysqld_safe --datadir="/var/lib/mysql" &

# Attendre que MariaDB soit prêt
sleep 10

# Crée la base de données
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# Crée l'utilisateur et lui donne les droits
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"

# Modifie le mot de passe de l'utilisateur root
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# Applique les changements
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# Arrête MariaDB proprement
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

# Relance MariaDB en mode sûr pour rester en exécution
exec mysqld_safe

