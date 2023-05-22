NAME = inception
SRC_DIR = ./srcs/
SRC= $(addprefix $(SRC_DIR), docker-compose.yml)
ALL_CONTAINER=docker ps -aq
ALL_IMAGES=docker images -aq


$(NAME) :
	make up

up:
	docker compose -f $(SRC) up

down:
	docker compose -f $(SRC) down

clean:
	$(ALL_CONTAINER) | xargs docker stop
	$(ALL_CONTAINER) | xargs docker rm
	$(ALL_IMAGES) | xargs docker rmi
	rm -rf ./volumes/mariadb/* ./volumes/wordpress/*
	rm -rf ./volumes/mariadb/.is_root_reset ./volumes/wordpress/.is_wp_installed

.PHONY: up, down, clean
