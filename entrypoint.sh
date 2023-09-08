#!/bin/bash
set -e

rm -f /myapp/tmp/pids/server.pid

# コンテナが実行される度にmigrateを実行する
db_env="development"
case "$RAILS_ENV" in
    "production" ) db_env="production" ;;
    "test" ) db_env="test" ;;
esac

# bundle exec ridgepole -c config/database.yml -E $db_env -f db/Schemafile --apply

exec "$@"