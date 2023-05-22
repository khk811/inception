NAME = inception
SRC_DIR = ./srcs/
SRC= $(addprefix $(SRC_DIR), docker-compose.yml)
ALL_CONTAINER=docker ps -aq
ALL_IMAGES=docker images -aq
DB_DIR=/home/hyunkkim/data/mariadb
WP_DIR=/home/hyunkkim/data/wordpress


$(NAME) :
	make up

up:
	docker compose -f $(SRC) up

down:
	docker compose -f $(SRC) down

clean:
	rm -rf $(wildcard $(DB_DIR)/*) $(wildcard $(WP_DIR)/*)
	rm -rf $(addprefix $(DB_DIR), /.is_root_reset) $(addprefix $(WP_DIR), /.is_wp_installed)
	$(ALL_CONTAINER) | xargs docker stop
	$(ALL_CONTAINER) | xargs docker rm
	$(ALL_IMAGES) | xargs docker rmi

.PHONY: up, down, clean
