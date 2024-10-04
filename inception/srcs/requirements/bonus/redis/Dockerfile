# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/01 11:35:06 by seblin            #+#    #+#              #
#    Updated: 2024/10/04 09:52:59 by seblin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:11

RUN apt-get update && apt-get install -y redis-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no"]