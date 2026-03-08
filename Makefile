.PHONY: up down restart logs ps pull

up:
	docker compose -f ../db/docker-compose.yml up -d
	docker compose -f ../gateway/docker-compose.yml up -d
	docker compose -f ../monitor/docker-compose.yml up -d
	docker compose -f ../backup/docker-compose.yml up -d
	docker compose -f ../dashboard/docker-compose.yml up -d
	docker compose -f ../seo/docker-compose.yml up -d
	docker compose -f ../ranktracker/docker-compose.yml up -d
	docker compose -f ../analytics/docker-compose.yml up -d
	docker compose -f ../auth/docker-compose.yml up -d

down:
	docker compose -f ../auth/docker-compose.yml down
	docker compose -f ../analytics/docker-compose.yml down
	docker compose -f ../ranktracker/docker-compose.yml down
	docker compose -f ../seo/docker-compose.yml down
	docker compose -f ../dashboard/docker-compose.yml down
	docker compose -f ../backup/docker-compose.yml down
	docker compose -f ../monitor/docker-compose.yml down
	docker compose -f ../gateway/docker-compose.yml down
	docker compose -f ../db/docker-compose.yml down

restart:
	make down
	make up

logs:
	docker compose logs -f --tail=100

ps:
	docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

pull:
	docker compose -f ../db/docker-compose.yml pull
	docker compose -f ../gateway/docker-compose.yml pull
	docker compose -f ../monitor/docker-compose.yml pull
	docker compose -f ../backup/docker-compose.yml pull
	docker compose -f ../dashboard/docker-compose.yml pull
	docker compose -f ../seo/docker-compose.yml pull
	docker compose -f ../ranktracker/docker-compose.yml pull
	docker compose -f ../analytics/docker-compose.yml pull
	docker compose -f ../auth/docker-compose.yml pull