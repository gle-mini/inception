all:
	-if ! grep -q "gle-mini.42.fr" /etc/hosts; then echo "127.0.0.1 gle-mini.42.fr" | sudo tee -a /etc/hosts; fi
	-mkdir -p /home/gle-mini/data/mariadb
	-mkdir -p /home/gle-mini/data/wordpress
	-docker compose --file srcs/docker-compose.yml build
	-docker compose --file srcs/docker-compose.yml up --detach

stop:
	-docker compose --file srcs/docker-compose.yml stop

down:
	-docker compose --file srcs/docker-compose.yml down

prune:
	-docker system prune --all --force

clean:
	-docker system prune --all --force --volumes

fclean:
	-docker 		stop 		  $$(docker ps -qa)
	-docker 		rm 	  --force $$(docker ps -qa)
	-docker 		rmi   --force $$(docker images -qa)
	-docker volume  rm 			  $$(docker volume ls -q)
	-rm -rf /home/gle-mini/data
	-docker network rm 			  $$(docker network ls -q)
	-sed -i '/gle-mini\.42\.fr/d' /etc/hosts
	-docker builder prune --force

re:
	$(MAKE) clean
	$(MAKE) all

.PHONY: all setup build up stop down prune clean fclean re
