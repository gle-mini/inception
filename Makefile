# ARGS


# CMD

all:
		-if ! grep -q "gurvan.42.fr" /etc/hosts; then echo "127.0.0.1 gurvan.42.fr" | sudo tee -a /etc/hosts; fi
		@sudo mkdir -p /home/gurvan/data/db
		@sudo mkdir -p /home/gurvan/data/wp
		@sudo mkdir -p /home/gurvan/data/prt
		@sudo docker compose -f srcs/docker-compose.yml up --build -d

up:
		-if ! grep -q "gurvan.42.fr" /etc/hosts; then echo "127.0.0.1 gurvan.42.fr" | sudo tee -a /etc/hosts; fi
		@sudo mkdir -p /home/gurvan/data/db
		@sudo mkdir -p /home/gurvan/data/wp
		@sudo mkdir -p /home/gurvan/data/prt
		@sudo docker compose -f srcs/docker-compose.yml up -d

down:
		@sudo docker compose -f srcs/docker-compose.yml down

clean:
		@chmod 744 clean.sh
		@./clean.sh

info:
		@echo "=============================== IMAGES ==============================="
		@docker images
		@echo
		@echo "============================= CONTAINERS ============================="
		@docker ps -a
		@echo
		@echo "=============== NETWORKS ==============="
		@docker network ls
		@echo
		@echo "====== VOLUMES ======"
		@docker volume ls

.PHONY:	all up down clean info
