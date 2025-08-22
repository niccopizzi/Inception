IMG_VERSION=inception
DC=docker-compose -f ./srcs/docker-compose.yml
DC_RM=docker image rm

MARIADB=mariadb
NGINX=nginx
WORDPRESS=wordpress

build-mariadb:
	$(DC) build $(MARIADB)

up-mariadb:
	$(DC) up $(MARIADB)

stop-mariadb:
	$(DC) stop $(MARIADB)

restart-mariadb:
	$(DC) restart $(MARIADB)

down-mariadb:
	$(DC) down $(MARIADB)

redo-mariadb:	down-mariadb build-mariadb up-mariadb

build-nginx:
	$(DC) build $(NGINX)

up-nginx:
	$(DC) up -d $(NGINX)

stop-nginx:
	$(DC) stop $(NGINX)

restart-nginx:
	$(DC) restart $(NGINX)

down-nginx:
	$(DC) down $(NGINX)

redo-nginx:	down-nginx build-nginx up-nginx

build-all:
	$(DC) build

up-all:
	$(DC) up -d

stop-all:
	$(DC) stop

restart-all:
	$(DC) restart

down-all:
	$(DC) down

redo-all: down-all build-all up-all
