all: docker-setup docker-start mongo-create mongo-start

clean: mongo-clean docker-stop

restart: clean all

docker-setup: 
	brew install docker docker-buildx colima

docker-start: 
	colima start

docker-stop: 
	colima stop || echo "Docker is not running"

mongo-create: 
	docker run --name mongodb-server -d -p 27017:27017 mongo:latest

mongo-start:
	docker start mongodb-server
	docker ps

mongo-shell: 
	docker exec -it mongodb-server bash

mongo-stat: 
	docker exec -it mongodb-server mongostat

mongo-stop:
	docker stop mongodb-server || echo "MongoDB is not running"

mongo-remove:
	docker rm mongodb-server || echo "MongoDB container is not present"

mongo-clean: mongo-stop mongo-remove

