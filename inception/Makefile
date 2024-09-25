# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/23 13:47:18 by seblin            #+#    #+#              #
#    Updated: 2024/09/25 20:06:38 by seblin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

start:
	docker-compose -f ./srcs/docker-compose.yml start
	
stop:
	docker-compose -f ./srcs/docker-compose.yml stop
	
up:
	docker-compose -f ./srcs/docker-compose.yml up
	
down:
	docker-compose -f ./srcs/docker-compose.yml down
	
f_up:
	docker-compose -f ./srcs/docker-compose.yml up --build
	
f_down:
	docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	docker network prune -f
	$(MAKE) clean
	$(MAKE) flush_vols

clean:
	-docker stop $$(docker ps -qa)
	-docker rm $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q);
	-docker network rm $$(docker network ls -q)

deploy:
	docker build -t mariadb42 ./srcs/requirements/mariadb \
		&& docker build -t wordpress42 ./srcs/requirements/wordpress \
		&& docker build -t nginx42 ./srcs/requirements/nginx \
		&& docker stack deploy --compose-file ./srcs/docker-compose.yml \
			mystack --detach=false
	
undeploy:	
	docker stack rm mystack
	docker network prune -f
	-docker service rm $(shell docker service ls -q)
	$(MAKE) clean
	$(MAKE) flush_vols
	
flush_vols:	
	sudo rm -rf \
		/home/svidot/data/maria_data/* \
		/home/svidot/data/wordpress_data/*

swarm:
	docker swarm init
	$(MAKE) secret
	docker swarm info

swarm_leave:	
	docker swarm leave --force
	docker swarm info

secret:
	-docker secret create db_root_password ./secrets/db_root_password
	-docker secret create db_password ./secrets/db_password
	-docker secret create db_user ./secrets/db_user
	-docker secret create wp_user ./secrets/wp_user
	-docker secret create wp_password ./secrets/wp_password
	-docker secret create wp_adm_user ./secrets/wp_adm_user
	-docker secret create wp_adm_password ./secrets/wp_adm_password