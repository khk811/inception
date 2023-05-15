NAME = inception
SRC_DIR = ./srcs/
SRC= $(addprefix $(SRC_DIR), docker-compose.yml)
ALL_CONTAINER=docker ps -aq
ALL_IMAGES=docker images -aq

$(NAME) :
	make all

all:
	docker compose -f $(SRC) up

clean:
	docker compose -f $(SRC) down

fclean:
	$(ALL_CONTAINER) | xargs docker stop
	$(ALL_CONTAINER) | xargs docker rm
	$(ALL_IMAGES) | xargs docker rmi
	rm -rf ./volumes/mariadb ./volumes/wordpress

re: fclean
	make all
.PHONY: all, clean, fclean, re
