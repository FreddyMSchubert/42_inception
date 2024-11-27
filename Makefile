COMPOSE := ./srcs/docker-compose.yml

run:
	docker compose -f $(COMPOSE) up -d
stop:
	docker compose -f $(COMPOSE)  down
