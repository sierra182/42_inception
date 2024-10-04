# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/29 12:19:09 by seblin            #+#    #+#              #
#    Updated: 2024/10/04 11:16:57 by seblin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:11

RUN apt-get update && apt-get install -y vsftpd

COPY ./conf/vsftpd.conf /etc/

# RUN groupadd ftpgroup \
#     && useradd -g www-data -d /var/www/wordpress -s /bin/bash ftpuser \
#     && echo "ftpuser:password" | chpasswd

# RUN mkdir -p /var/www/wordpress && \
#     chown -R www-data:www-data /var/www/wordpress

RUN useradd -g www-data -d /var/www/wordpress -s /bin/bash ftpuser \
    && echo "ftpuser:password" | chpasswd

RUN mkdir -p /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress


	
RUN mkdir -p /var/run/vsftpd/empty && chmod 755 /var/run/vsftpd/empty

RUN mkdir -p /etc/ssl/ftp && chmod 755 /etc/ssl/ftp 

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd.conf"]
