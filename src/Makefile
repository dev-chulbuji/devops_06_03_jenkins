VERSION_FILE := ./VERSION
TAG := $(shell cat ${VERSION_FILE})
DOCKER_GID := $(getent group docker | awk -F: '{printf "%d",$3}')
SERVICE := 'jenkins'

run:
	export TAG=$(TAG); export DOCKER_GID=$(DOCKER_GID); docker-compose up -d;

log:
	docker logs -f $(SERVICE) 

exec:
	docker exec -it $(SERVICE) sh -c "((clear && bash) || (clear && sh))"
