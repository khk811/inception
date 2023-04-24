NAME = inception
SRC_DIR = ./srcs/
SRC= $(addprefix $(SRC_DIR), docker-compose.yml)

$(NAME) :
	make all

all:
	docker compose -f $(SRC) up -d

clean:
	docker compose -f $(SRC) down

.PHONY: all, clean
