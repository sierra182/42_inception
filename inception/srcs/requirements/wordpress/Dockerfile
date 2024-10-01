# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 18:20:29 by seblin            #+#    #+#              #
#    Updated: 2024/10/01 13:19:09 by seblin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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
	
RUN wget https://wordpress.org/wordpress-6.6.1.zip \
	&& unzip wordpress-6.6.1.zip \
	&& mkdir -p /var/www/html \
	&& mv wordpress/* /var/www/html \
	&& rm wordpress-6.6.1.zip \
	&& mkdir -p /run/php/

RUN	wget \
	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/wp-config.php /var/www/html/
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

COPY ./tools/init_wp.sh /usr/local/bin/init_wp.sh
RUN chmod +x /usr/local/bin/init_wp.sh


# Installation de Redis et de l'extension PHP pour Redis
RUN apt-get update && apt-get install -y \
    php-redis \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Téléchargement et installation du plugin Redis Object Cache pour WordPress
# Cette section télécharge le plugin Redis Object Cache et le place dans le dossier des plugins de WordPress.
RUN curl -o /tmp/redis-cache.zip -fSL "https://downloads.wordpress.org/plugin/redis-cache.latest-stable.zip" \
    && unzip /tmp/redis-cache.zip -d /var/www/html/wp-content/plugins/ \
    && rm /tmp/redis-cache.zip

# # Activation du plugin Redis Object Cache avec WP-CLI
# # Ces commandes activent le plugin Redis pour WordPress afin qu'il soit prêt à l'usage dès le lancement du container.
# RUN wp plugin activate redis-cache --allow-root --path=/var/www/html

# # Activer Redis pour WordPress via WP-CLI
# RUN wp redis enable --allow-root


EXPOSE 9000

ENTRYPOINT [ "init_wp.sh" ]
CMD [ "php-fpm7.4", "-F" ]