FROM debian:11

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    wget \
    curl \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get install -y \
	default-mysql-client \	
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#!! lastest ?
RUN wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	mkdir -p /var/www/html && \
	mv wordpress/* /var/www/html && \
	rm latest.zip && \
	mkdir -p /run/php/

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

#!! 
# RUN wp core install --path=/var/www/html \
#     --url="http://localhost" \
#     --title="Mon Super Site" \
#     --admin_user="admin" \
#     --admin_password="mot_de_passe_admin" \
#     --admin_email="admin@exemple.com" \
#     --skip-email \
#     --locale="fr_FR" \
# 	--allow-root

# Modifie le fichier www.conf pour écouter sur le port 9000 et pas sur le socket
# RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = wordpress:9000|" \
# 	/etc/php/7.4/fpm/pool.d/www.conf

RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = wordpress:9000|" \
    /etc/php/7.4/fpm/pool.d/www.conf \
    && sed -i '$ a\env[WORDPRESS_DB_HOST] = $WORDPRESS_DB_HOST' /etc/php/7.4/fpm/pool.d/www.conf \
	&& sed -i '$ a\env[WORDPRESS_DB_NAME] = $WORDPRESS_DB_NAME' /etc/php/7.4/fpm/pool.d/www.conf \
	&& sed -i '$ a\env[WORDPRESS_DB_USER_FILE] = $WORDPRESS_DB_USER_FILE' /etc/php/7.4/fpm/pool.d/www.conf \
	&& sed -i '$ a\env[WORDPRESS_DB_PASSWORD_FILE] = $WORDPRESS_DB_PASSWORD_FILE' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/wp-config.php /var/www/html/wp-config.php
# Copier le fichier wp-config.php dans le container

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

EXPOSE 9000

COPY ./tools/init_wp.sh /usr/local/bin/init_wp.sh
RUN chmod +x /usr/local/bin/init_wp.sh
ENTRYPOINT [ "init_wp.sh" ]
CMD ["php-fpm7.4", "-F"]