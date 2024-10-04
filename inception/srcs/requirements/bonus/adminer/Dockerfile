# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/01 10:55:02 by seblin            #+#    #+#              #
#    Updated: 2024/10/04 10:07:05 by seblin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:11

RUN apt-get update && apt-get install -y \
    php-cli \
    php-mysqli \
    php-json \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html && wget "https://github.com/vrana/adminer/releases/\
download/v4.8.1/adminer-4.8.1.php" -O /var/www/html/index.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
