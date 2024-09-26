#!bin/bash

until mysqladmin ping -h"${WORDPRESS_DB_HOST}"; do
	echo "Waiting for MariaDB...";
	sleep 5;
done;
echo "MariaDB is ready!"

if ! wp core is-installed --path=/var/www/html --allow-root; then
	wp core install --path=/var/www/html \
	--url="https://${DOMAIN_NAME}" \
	--title="Mon Site Pas Terrible" \
	--admin_user="$(cat ${WORDPRESS_ADM_USER_FILE})" \
	--admin_password="$(cat ${WORDPRESS_ADM_PASSWORD_FILE})" \
	--admin_email="sauron@exemple.com" \
	--skip-email \
	--locale="fr_FR" --allow-root;
else
	echo "WordPress is already installed.";
fi

if ! wp user get $(cat ${WORDPRESS_USER_FILE}) \
	--path=/var/www/html --allow-root >/dev/null 2>&1; then
		wp user create $(cat ${WORDPRESS_USER_FILE}) \
		$(cat ${WORDPRESS_USER_FILE})@42.fr \
		--role=editor --user_pass=$(cat ${WORDPRESS_PASSWORD_FILE}) \
		--path=/var/www/html --allow-root;
else
	echo "User $(cat ${WORDPRESS_USER_FILE}) already exists.";
fi

exec "$@"