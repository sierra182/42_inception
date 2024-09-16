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

RUN wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	mkdir -p /var/www/html && \
	mv wordpress/* /var/www/html && \
	rm latest.zip && \
	mkdir -p /run/php/


RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

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
RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|" \
/etc/php/7.4/fpm/pool.d/www.conf

COPY wp-config.php /var/www/html/wp-config.php
# Copier le fichier wp-config.php dans le container

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]