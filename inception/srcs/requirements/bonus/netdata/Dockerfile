# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/03 13:10:13 by seblin            #+#    #+#              #
#    Updated: 2024/10/03 13:17:03 by seblin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:11

RUN apt-get update && apt-get install -y \
    curl \
    netcat \
    ca-certificates \
    && apt-get clean

RUN curl -L https://my-netdata.io/kickstart-static64.sh -o /tmp/kickstart.sh

RUN bash /tmp/kickstart.sh --dont-wait --dont-start-it

EXPOSE 19999

CMD ["/usr/sbin/netdata", "-D"]

