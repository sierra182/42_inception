#!bin/bash

until mysql -h"${WORDPRESS_DB_HOST}" -u"$(cat ${WORDPRESS_DB_USER_FILE})" -p"$(cat ${WORDPRESS_DB_PASSWORD_FILE})" "${WORDPRESS_DB_NAME}" -e "SELECT 1" >/dev/null 2>&1; do
echo "Waiting for MariaDB...";
sleep 5;
done;

if ! wp core is-installed --path=/var/www/html --allow-root; then
wp core install --path=/var/www/html \
	--url="https://svidot.42.fr" \
	--title="Mon Super Site" \
	--admin_user="admin" \
	--admin_password="mot_de_passe_admin" \
	--admin_email="admin@exemple.com" \
	--skip-email \
	--locale="fr_FR" --allow-root;
else
echo "WordPress is already installed.";
fi

if ! wp user get dupont --path=/var/www/html --allow-root >/dev/null 2>&1; then
wp user create dupont dupont@example.com --role=editor --user_pass=super_pass --path=/var/www/html --allow-root;
else
echo "User dupont already exists.";
fi

php-fpm7.4 -F