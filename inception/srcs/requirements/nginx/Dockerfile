# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/22 09:37:30 by seblin            #+#    #+#              #
#    Updated: 2024/09/30 17:59:18 by seblin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:11

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
	procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]