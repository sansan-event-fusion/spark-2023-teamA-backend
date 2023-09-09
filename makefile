up:
	docker-compose up
build:
	docker-compose build --no-cache
install:
	docker-compose run api bundle install
migrate:
	docker-compose run api bundle exec ridgepole -c config/database.yml -E development -f db/Schemafile --apply && make annotate
annotate:
	docker-compose run api bundle exec annotate
console:
	docker-compose run api bundle exec rails c