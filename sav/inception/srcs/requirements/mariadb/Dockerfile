FROM debian:11

RUN  apt-get update \	
	&& apt-get install -y mariadb-server \
    && apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*	
	
RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld
	
# RUN sed -i 's/bind-address\s*=.*/bind-address = 0.0.0.0/' \
# 	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/init_db.sh /usr/local/bin/init_db.sh
RUN chmod +x /usr/local/bin/init_db.sh

CMD ["/usr/local/bin/init_db.sh", "&&", "mysqld_safe"]
# CMD ["mysqld"]