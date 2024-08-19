up:
	docker compose up -d
	docker exec app composer install
	@echo 'Web: http://localhost:8080'

down:
	@docker compose down

restart: down up

check:
	docker exec app vendor/bin/php-cs-fixer fix --allow-risky=yes
	docker exec app vendor/bin/psalm
	docker exec app vendor/bin/phpstan analyse

shell:
	@docker compose exec app bash
