# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/29 12:19:09 by seblin            #+#    #+#              #
#    Updated: 2024/10/04 11:58:25 by seblin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:11

RUN apt-get update && apt-get install -y vsftpd

COPY ./conf/vsftpd.conf /etc/

COPY ./tools/init_ftp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init_ftp.sh

RUN mkdir -p /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress
	
RUN mkdir -p /var/run/vsftpd/empty && chmod 755 /var/run/vsftpd/empty

RUN mkdir -p /etc/ssl/ftp && chmod 755 /etc/ssl/ftp 

EXPOSE 21

ENTRYPOINT [ "init_ftp.sh" ]
CMD ["vsftpd", "/etc/vsftpd.conf"]
