# Makefile

all: build

build:
	@docker build -t mandarinsolutions/observium .

run:
	@docker-compose up -d

clean:
	@docker-compose down -v 

purge:
	@docker-compose down -v --rmi all
