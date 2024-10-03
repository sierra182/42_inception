# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: seblin <seblin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/23 13:47:18 by seblin            #+#    #+#              #
#    Updated: 2024/10/03 13:13:07 by seblin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			#*********************** basics ***********************#	
																			
start:
	docker-compose -f ./srcs/docker-compose.yml start
	
stop:
	docker-compose -f ./srcs/docker-compose.yml stop
		
	
			#********************* cleanning *********************#
			
clean:
	-docker stop $$(docker ps -qa)
	-docker rm $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q)
	-echo y | docker network rm $$(docker network ls -q)
	
flush_vols:	
	sudo rm -rf \
		/home/svidot/data/maria_data/* \
		/home/svidot/data/wordpress_data/*
		
		
			#********************* composing *********************#		
				
s_up:
	docker-compose -f ./srcs/docker-compose.yml up
	
s_down:
	docker-compose -f ./srcs/docker-compose.yml down
	
up:
	docker-compose -f ./srcs/docker-compose.yml up --build
	
down:
	docker-compose -f ./srcs/docker-compose.yml down
	$(MAKE) clean	
	
f_down: down
	$(MAKE) flush_vols
	
	
			#********************* deploying *********************#		
				
s_deploy:
	docker stack deploy --compose-file ./srcs/docker-compose-swarm.yml \
			mystack --detach=false
s_undeploy:
	docker stack rm mystack
			
deploy: swarm
	-docker build -t mariadb42 ./srcs/requirements/mariadb 
	-docker build -t wordpress42 ./srcs/requirements/wordpress 
	-docker build -t nginx42 ./srcs/requirements/nginx 
	-docker stack deploy --compose-file ./srcs/docker-compose-swarm.yml \
		mystack --detach=false

undeploy:
	$(MAKE) swarm_leave
	$(MAKE) clean

f_undeploy:	undeploy
	$(MAKE) flush_vols
	
	
			#********************** secrets **********************#		
				
swarm:
	-docker swarm init
	$(MAKE) secret

swarm_leave:	
	-docker swarm leave --force

secret:
	-docker secret create db_root_password ./secrets/db_root_password
	-docker secret create db_password ./secrets/db_password
	-docker secret create db_user ./secrets/db_user
	-docker secret create wp_user ./secrets/wp_user
	-docker secret create wp_password ./secrets/wp_password
	-docker secret create wp_adm_user ./secrets/wp_adm_user
	-docker secret create wp_adm_password ./secrets/wp_adm_password
	-docker secret create ng_key ./secrets/nginx.key
	-docker secret create auth_key ./secrets/php_keys/auth_key
	-docker secret create auth_salt ./secrets/php_keys/auth_salt
	-docker secret create logged_in_key ./secrets/php_keys/logged_in_key
	-docker secret create logged_in_salt ./secrets/php_keys/logged_in_salt
	-docker secret create nonce_key ./secrets/php_keys/nonce_key
	-docker secret create nonce_salt ./secrets/php_keys/nonce_salt
	-docker secret create secure_auth_key ./secrets/php_keys/secure_auth_key
	-docker secret create secure_auth_salt ./secrets/php_keys/secure_auth_salt


			#*********************** utils ***********************#

info:
	@echo
	-docker ps -a
	@echo
	-docker images
	@echo
	-docker volume ls
	@echo
	-docker network ls
	@echo 
	-docker service ls
	@echo 
	-docker stack ls
	@echo 
	-docker-compose -f ./srcs/docker-compose.yml ps
	@echo 
	-docker secret ls	