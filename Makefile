NAME = inception
SRC_DIR = ./srcs/
SRC= $(addprefix $(SRC_DIR), docker-compose.yml)
ALL_CONTAINER=docker ps -aq
ALL_IMAGES=docker images -aq
# DB_DIR=/home/hyunkkim/data/mariadb
# WP_DIR=/home/hyunkkim/data/wordpress
DB_DIR=./volumes/mariadb
WP_DIR=./volumes/wordpress


$(NAME) :
	make up

up:
	docker compose -f $(SRC) up

down:
	docker compose -f $(SRC) down

clean:
	rm -rf $(wildcard $(DB_DIR)/*) $(wildcard $(WP_DIR)/*)
	rm -rf $(addprefix $(DB_DIR), /.root_pw_reset) $(addprefix $(WP_DIR), /.wp_installed)
	$(ALL_CONTAINER) | xargs docker rm
	$(ALL_IMAGES) | xargs docker rmi

.PHONY: up, down, clean
