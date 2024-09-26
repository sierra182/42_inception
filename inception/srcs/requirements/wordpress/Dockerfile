# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 18:20:29 by seblin            #+#    #+#              #
#    Updated: 2024/09/26 16:19:24 by seblin           ###   ########.fr        #
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
	
# ARG WORDPRESS_DB_HOST
# ARG WORDPRESS_DB_NAME
# ARG WORDPRESS_DB_USER_FILE
# # ARG WORDPRESS_DB_PASSWORD_FILE

# # ENV WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}
# ENV WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
# ENV WORDPRESS_DB_USER_FILE=${WORDPRESS_DB_USER_FILE}
# # ENV WORDPRESS_DB_PASSWORD_FILE=${WORDPRESS_DB_PASSWORD_FILE}
# RUN echo TOTO
# RUN echo $SECRETS_PATH
# # RUN echo $WORDPRESS_DB_HOST
# RUN echo $WORDPRESS_DB_NAME
# RUN echo $WORDPRESS_DB_PASSWORD_FILE
# RUN echo WORDPRESS_DB_NAME
# RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|" \
#     /etc/php/7.4/fpm/pool.d/www.conf \
#     && sed -i "$ a\env[WORDPRESS_DB_HOST] = $WORDPRESS_DB_HOST" \
# 		/etc/php/7.4/fpm/pool.d/www.conf \
# 	&& sed -i "$ a\env[WORDPRESS_DB_NAME] = $WORDPRESS_DB_NAME" \
# 		/etc/php/7.4/fpm/pool.d/www.conf \
# 	&& sed -i '$ a\env[WORDPRESS_DB_USER_FILE] = $WORDPRESS_DB_USER_FILE' \
# 		/etc/php/7.4/fpm/pool.d/www.conf \
# 	&& sed -i '$ a\env[WORDPRESS_DB_PASSWORD_FILE] \
# 		= $WORDPRESS_DB_PASSWORD_FILE' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/wp-config.php /var/www/html/
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

COPY ./tools/init_wp.sh /usr/local/bin/init_wp.sh
RUN chmod +x /usr/local/bin/init_wp.sh

EXPOSE 9000

ENTRYPOINT [ "init_wp.sh" ]
CMD [ "php-fpm7.4", "-F" ]