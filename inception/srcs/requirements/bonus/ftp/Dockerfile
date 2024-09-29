# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/29 12:19:09 by seblin            #+#    #+#              #
#    Updated: 2024/09/29 16:40:12 by seblin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:11

RUN apt-get update && apt-get install -y vsftpd

COPY ./conf/vsftpd.conf /etc/

# RUN groupadd ftpgroup \
#     && useradd -g ftpgroup -d /var/www/wordpress -s /sbin/nologin ftpuser

RUN groupadd ftpgroup \
    && useradd -g ftpgroup -d /var/www/wordpress -s /sbin/nologin ftpuser \
    && echo "ftpuser:password" | chpasswd


RUN mkdir -p /var/www/wordpress && \
    chown -R ftpuser:ftpgroup /var/www/wordpress

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd.conf"]
