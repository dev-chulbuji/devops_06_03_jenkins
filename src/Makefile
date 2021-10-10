VERSION_FILE := ./VERSION
TAG := $(shell cat ${VERSION_FILE})
SERVICE := 'jenkins'

run:
	export TAG=$(TAG); docker-compose down; docker-compose up -d; docker logs -f $(SERVICE) 

log:
	docker logs -f $(SERVICE) 

exec:
	docker exec -it $(SERVICE) sh -c "((clear && bash) || (clear && sh))"
