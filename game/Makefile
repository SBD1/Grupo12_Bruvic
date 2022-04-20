current_dir := $(shell pwd)
user := $(shell whoami) 

up: 
	sudo docker-compose up

build: 
	sudo docker-compose up --build
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init-db:
	sudo docker-compose exec app node -e 'require("./src/db/db_config").initDatabase()'

populate-db:
	sudo docker-compose exec app node -e 'require("./src/db/db_config").populateDatabase()'