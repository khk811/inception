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
	docker stop $(ALL_CONTAINER)
	docker rm $(ALL_CONTAINER)
	docker rmi $(ALL_IMAGES)

.PHONY: all, clean, fclean
