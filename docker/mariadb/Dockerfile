FROM debian:11

RUN  apt-get update \
	&& apt-get install -y mariadb-server \
	&& rm -rf /var/lib/apt/lists/* \	
    && apt-get clean
	
RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld

CMD ["mysqld"]