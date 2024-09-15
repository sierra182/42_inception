FROM debian:11

RUN  apt-get update \
	&& apt-get install -y mariadb-server \
    && apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*	
	
RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld

CMD ["mysqld"]