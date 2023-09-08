up:
	docker-compose up
build:
	docker-compose build --no-cache
install:
	docker-compose run api bundle install
migrate:
	docker-compose run api bundle exec rails db:migrate
# down:
#     docker-compose down