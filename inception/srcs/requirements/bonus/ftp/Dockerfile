# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/29 12:19:09 by seblin            #+#    #+#              #
#    Updated: 2024/09/30 17:54:57 by seblin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# FROM debian:11

# RUN apt-get update && apt-get install -y vsftpd

# COPY ./conf/vsftpd.conf /etc/

# # RUN groupadd ftpgroup \
# #     && useradd -g ftpgroup -d /var/www/wordpress -s /sbin/nologin ftpuser

# # RUN groupadd ftpgroup \
# #     && useradd -g ftpgroup -d /var/www/wordpress -s /sbin/nologin ftpuser \
# #     && echo "ftpuser:password" | chpasswd

# # RUN groupadd ftpgroup \
# #     && useradd -g www-data -d /var/www/wordpress -s /sbin/nologin www-data \
#    RUN echo "www-data:p" | chpasswd

# RUN mkdir -p /var/www/wordpress && \
#     chown -R www-data:www-data /var/www/wordpress

# RUN	mkdir -p /var/run/vsftpd/empty

# RUN chmod 755 /var/run/vsftpd/empty

# EXPOSE 21

# CMD ["vsftpd", "/etc/vsftpd.conf"]

FROM debian:11

# Installation de VSFTPD
RUN apt-get update && apt-get install -y vsftpd

# Copier le fichier de configuration vsftpd.conf
COPY ./conf/vsftpd.conf /etc/

# Créer un utilisateur FTP (ftpuser) et le définir dans le groupe www-data
RUN groupadd ftpgroup \
    && useradd -g www-data -d /var/www/wordpress -s /bin/bash ftpuser \
    && echo "ftpuser:password" | chpasswd

# Créer le répertoire pour Wordpress et définir les permissions
RUN mkdir -p /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress

# Créer le répertoire secure_chroot_dir requis par vsftpd
RUN mkdir -p /var/run/vsftpd/empty && chmod 755 /var/run/vsftpd/empty

# chmod oblig ?
RUN mkdir -p /etc/ssl/ftp && chmod 755 /etc/ssl/ftp 


# Exposer le port 21 (FTP)
EXPOSE 21

# Démarrer vsftpd avec le fichier de configuration
CMD ["vsftpd", "/etc/vsftpd.conf"]