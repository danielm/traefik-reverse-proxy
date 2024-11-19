ENVIRONMENTS := dev prod
TAG_NAME ?= latest
PROJECT_NAME := my-project-shortname
PRIVATE_REPO := private-registry.domain.com

# Pattern rule to deploy environment-specific containers
$(ENVIRONMENTS):
	docker compose -f docker-compose.yml -f docker-compose.$@.yml build

# Target to start environment-specific images
up:
	docker compose -f docker-compose.yml -f docker-compose.$(ENV).yml up -d

# Set default environment to "dev" if not specified
ENV ?= dev

# Compose to work locally
stop:
	docker compose -f docker-compose.yml -f docker-compose.$(ENV).yml stop

logs:
	docker compose logs -f &

down:
	docker compose -f docker-compose.yml -f docker-compose.$(ENV).yml down

down:
	docker compose -f docker-compose.yml -f docker-compose.$(ENV).yml build
ps:
	docker compose -f docker-compose.yml -f docker-compose.$(ENV).yml ps

##
## Registry and image building
##
build:
	docker compose -f docker-compose.yml -f docker-compose.dev.yml build
tag:
	docker tag $(PROJECT_NAME) $(PRIVATE_REPO)/$(PROJECT_NAME):$(TAG_NAME)
push:
	docker push $(PRIVATE_REPO)/$(PROJECT_NAME):$(TAG_NAME)
pull:
	docker pull $(PRIVATE_REPO)/$(PROJECT_NAME):$(TAG_NAME)
clean:
	docker image rm $(PROJECT_NAME) $(PRIVATE_REPO)/$(PROJECT_NAME)
