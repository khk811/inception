NAME = inception
SRC_DIR = ./srcs/
SRC= $(addprefix $(SRC_DIR), docker-compose.yml)

$(NAME) :
	make all

all:
	docker compose -f $(SRC) up

clean:
	docker compose -f $(SRC) down

fclean:
	docker stop $(docker ps -qa);docker rm $(docker ps -qa);\
	docker rmi -f $(docker images -qa);docker volume rm $(docker volume ls -q);\
	docker network rm $(docker network ls -q) 2>/dev/null

.PHONY: all, clean
