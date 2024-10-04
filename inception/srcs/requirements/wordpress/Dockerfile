# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 18:20:29 by seblin            #+#    #+#              #
#    Updated: 2024/10/04 15:47:34 by seblin           ###   ########.fr        #
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
RUN chmod -R 777 /var/www/html

COPY ./tools/init_wp.sh /usr/local/bin/init_wp.sh
RUN chmod +x /usr/local/bin/init_wp.sh

RUN apt-get update && apt-get install -y \
    php-redis \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -o /tmp/redis-cache.zip -fSL \
	"https://downloads.wordpress.org/plugin/redis-cache.2.2.4.zip" \
    && unzip /tmp/redis-cache.zip -d /var/www/html/wp-content/plugins/ \
    && rm /tmp/redis-cache.zip

EXPOSE 9000

ENTRYPOINT [ "init_wp.sh" ]
CMD [ "php-fpm7.4", "-F" ]