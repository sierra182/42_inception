FROM debian:11

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Création d'un certificat auto-signé pour TLS (en développement)
RUN mkdir -p /etc/nginx/ssl && \
openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key \
-out /etc/nginx/ssl/nginx.crt \
-subj "/C=FR/ST=Perpignan/L=Perpignan/O=42/OU=42/CN=localhost"

# Copie du fichier de configuration NGINX
COPY ./nginx.conf /etc/nginx/nginx.conf

# Exposer le port 443 pour HTTPS
EXPOSE 80 443

# Commande pour démarrer NGINX
CMD ["nginx", "-g", "daemon off;"]