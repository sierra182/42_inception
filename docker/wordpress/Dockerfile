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

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]