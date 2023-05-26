NAME = inception
SRC_DIR = ./srcs/
BONUS_DIR= ./srcs/requirements/bonus/
SRC= $(addprefix $(SRC_DIR), docker-compose.yml)
BONUS= $(addprefix $(BONUS_DIR), docker-compose.yml)
ALL_CONTAINER=docker ps -aq
ALL_IMAGES=docker images -aq
DB_DIR=/home/hyunkkim/data/mariadb
WP_DIR=/home/hyunkkim/data/wordpress
# DB_DIR=./volumes/mariadb
# WP_DIR=./volumes/wordpress


$(NAME) :
	make up

up:
	docker compose -f $(SRC) up

down:
	docker compose -f $(SRC) down

bonus_up:
	docker compose -f $(BONUS) up

bonus_down:
	docker compose -f $(BONUS) down

clean: volume_clean
ifneq ($(shell $(ALL_CONTAINER) | wc -l ), 0)
	$(ALL_CONTAINER) | xargs docker rm -f
	@echo "[ CONTAINERS DELETED ]"
endif
ifneq ($(shell $(ALL_IMAGES) | wc -l ), 0)
	$(ALL_IMAGES) | xargs docker rmi -f
	@echo "[ IMAGES DELETED ]"
endif

volume_clean:
	@rm -rf $(wildcard $(DB_DIR)/*) $(wildcard $(WP_DIR)/*)
	@rm -rf $(addprefix $(DB_DIR), /.root_pw_reset) $(addprefix $(WP_DIR), /.wp_installed)
	@echo "[ DATA VOLUMES DELETED ]"

.PHONY: up, down, volume_clean, clean, bonus_up, bonus_down
