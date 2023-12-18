
all:
		@sudo mkdir -p /home/gle-mini/data/db
		@sudo mkdir -p /home/gle-mini/data/wp
		@sudo mkdir -p /home/gle-mini/data/prt
		@docker compose -f srcs/docker-compose.yml up --build -d

up:
		@sudo mkdir -p /home/gle-mini/data/db
		@sudo mkdir -p /home/gle-mini/data/wp
		@sudo mkdir -p /home/gle-mini/data/prt
		@docker compose -f srcs/docker-compose.yml up -d

down:
		@docker compose -f srcs/docker-compose.yml down

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
