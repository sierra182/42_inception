FROM debian:11

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    wget \
    curl \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://wordpress.org/latest.zip && \
	unzip latest.zip && \
	mkdir -p /var/www/html && \
	mv wordpress/* /var/www/html && \
	rm latest.zip && \
	mkdir -p /run/php/

	# Modifie le fichier www.conf pour écouter sur le port 9000 et pas sur le socket
RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|" \
	/etc/php/7.4/fpm/pool.d/www.conf

	# Copier le fichier wp-config.php dans le container
COPY wp-config.php /var/www/html/wp-config.php

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]