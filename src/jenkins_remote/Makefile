VERSION_FILE := ./VERSION
TAG := $(shell cat ${VERSION_FILE})
DOCKER_GID := $(shell getent group docker | awk -F: '{printf "%d",$$3}')
SERVICE := 'jenkins'

pre-run:
	echo "pre-run"
post-run:
	echo "post-run"
compose-run:
	export DOCKER_GID=$(DOCKER_GID); docker-compose up --build -d;
run: pre-run compose-run post-run

pre-destroy:
post-destroy:
compose-destroy:
	docker-compose down;
destroy: pre-destroy compose-destroy post-destroy

log:
	docker logs -f $(SERVICE)

exec:
	docker exec -it $(SERVICE) sh -c "((clear && bash) || (clear && sh))"
