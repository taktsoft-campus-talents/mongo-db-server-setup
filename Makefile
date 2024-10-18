all: docker-check mongo-create mongo-start

docker-setup: 
	brew install docker docker-buildx colima

docker-start: 
	colima start

docker-stop: 
	colima stop || echo "Docker is not running"

docker-check:
	@docker info > /dev/null 2>&1 || { echo " \
/-----------------------------------------------\ \n \
|              === ERROR ===                     | \n \
|------------------------------------------------| \n \
| Docker daemon is not running!                  | \n \
| Maybe you need to execute 'make docker-start?  | \n \
\-----------------------------------------------/ \n \
"; \
		exit 1; } 

mongo-create: docker-check
	@docker ps -a --format '{{.Names}}' | grep -Eq "^mongodb-server$$" || { \
		docker create --name mongodb-server -p 27017:27017 mongo:latest; \
		echo "MongoDB container created."; \
	}
	
mongo-start: docker-check
	@docker start mongodb-server || { echo " \
/------------------------------------------------\ \n \
|              === ERROR ===                     | \n \
|------------------------------------------------| \n \
| Mongo is not there!                            | \n \
| Maybe you need to execute 'make mongo-create?  | \n \
\------------------------------------------------/ \n \
"; \
		exit 1; } 
	docker ps

mongo-check: docker-check
	@docker ps --format '{{.Names}}' | grep -Eq "^mongodb-server$$" \
		&& echo "MongoDB container is running." || { \
		echo " \
/-----------------------------------------------\ \n \
|              === ERROR ===                     | \n \
|------------------------------------------------| \n \
| Mongo container is not running!                | \n \
| Maybe you need to execute 'make mongo-start?   | \n \
\-----------------------------------------------/ \n \
"; \
		exit 1; \
	}



mongo-shell: mongo-check
	docker exec -it mongodb-server bash

mongo-stat: mongo-check
	docker exec -it mongodb-server mongostat

mongo-stop: mongo-check
	docker stop mongodb-server
	@echo "MongoDB container stopped."

mongo-remove:
	docker rm mongodb-server 

mongo-clean: mongo-stop mongo-remove

clean: mongo-clean docker-stop

restart: clean all