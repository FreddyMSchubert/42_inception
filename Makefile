COMPOSE := ./srcs/docker-compose.yml

run:
	mkdir ./srcs/web
	docker compose -f $(COMPOSE) up -d
stop:
	docker compose -f $(COMPOSE)  down
