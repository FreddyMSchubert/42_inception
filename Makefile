COMPOSE := ./srcs/docker-compose.yml

start: run
run:
	mkdir -p ./srcs/web
	docker compose -f $(COMPOSE) up --build
stop:
	docker compose -f $(COMPOSE)  down
