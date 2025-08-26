DC=docker-compose -f ./srcs/docker-compose.yml

MANDATORY_SERVICE = mariadb wordpress nginx

BONUS_SERVICE = redis ftp adminer pingacont

mandatory-up:
	$(DC) up -d $(MANDATORY_SERVICE)

mandatory-down:
	$(DC) down $(MANDATORY_SERVICE)

mandatory-start:
	$(DC) start $(MANDATORY_SERVICE)

mandatory-stop:
	$(DC) stop $(MANDATORY_SERVICE)

mandatory-restart:
	$(DC) restart $(MANDATORY_SERVICE)

bonus-up:
	$(DC) up -d $(MANDATORY_SERVICE) $(BONUS_SERVICE)
	docker exec wordpress-container wp plugin activate redis-cache --allow-root
	docker exec wordpress-container wp redis enable --allow-root

bonus-down:
	$(DC) down $(MANDATORY_SERVICE) $(BONUS_SERVICE)

bonus-start:
	$(DC) start $(MANDATORY_SERVICE) $(BONUS_SERVICE)

bonus-stop:
	$(DC) stop $(MANDATORY_SERVICE) $(BONUS_SERVICE)

bonus-restart:
	$(DC) restart $(MANDATORY_SERVICE) $(BONUS_SERVICE)

.PHONY: mandatory-up mandatory-down mandatory-start mandatory-stop mandatory-restart \
		bonus-up bonus-down bonus-start bonus-stop bonus-restart
