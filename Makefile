ENVIRONMENTS := dev prod

# Pattern rule to deploy environment-specific containers
$(ENVIRONMENTS):
	docker compose -f docker-compose.yml -f docker-compose.$@.yml build

# Target to start environment-specific images
up:
	docker compose -f docker-compose.yml -f docker-compose.$(ENV).yml up -d

# Set default environment to "dev" if not specified
ENV ?= dev

# Now some basic stuff
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
