# README

## 環境構築

```shell
# entrypoint.shの以下の行をコメントアウトした上でmake upでコンテナを起動する
# bundle exec ridgepole -c config/database.yml -E $db_env -f db/Schemafile --apply
make up

# コンテナを立ち上げた状態で、データベースを作成する
make create

# テーブルを作成する
make migrate

# シードデータを登録する
make seed

# 上記のコメントアウトを戻した状態で、再度コンテナを起動する
make up
```

## 以下のようなエラーが出てdatebaseに接続できない際の対処法

docker-compose run --rm api rails db:create
```
[+] Running 1/0
 ⠿ Container fill-home-app-db-1  Running                                                   0.0s
[ERROR] We could not find your database:  fill-home-app. Which can be found in the database configuration file located at config/database.yml.

To resolve this issue:

- Did you create the database for this app, or delete it? You may need to create your database.
- Has the database name changed? Check your database.yml config has the correct database name.

To create your database, run:

        bin/rails db:create

        /usr/local/bundle/gems/activerecord-7.0.4/lib/active_record/connection_adapters/postgresql_adapter.rb:81:in `rescue in new_client'
make: *** [create] Error 1
```

### 1. dockerで稼働しているコンテナ名やidを確認する

docker ps

### 2. docker上でpostgresが起動しているか確認

docker exec -it [コンテナ名またはコンテナID] bash
```
root@ff262d00b69a:/#
```

### 3. postgresに接続

psql -U postgres
```
psql (15.2 (Debian 15.2-1.pgdg110+1))
Type "help" for help.
```

### 4. データベースを確認

 psql -U postgres -l (\lでも可)
```
postgres=#  \l
                                                  List of databases
     Name      |  Owner   | Encoding |  Collate   |   Ctype    | ICU Locale | Locale Provider |   Access privileges   
---------------+----------+----------+------------+------------+------------+-----------------+-----------------------
(0 rows)
```

### 5. データベースを作成

postgres=# CREATE DATABASE fill_home_app;
CREATE DATABASE

### 6. fill_home_apが作られたか確認
postgres=# \l

```
postgres=#  \l
                                                  List of databases
     Name      |  Owner   | Encoding |  Collate   |   Ctype    | ICU Locale | Locale Provider |   Access privileges   
---------------+----------+----------+------------+------------+------------+-----------------+-----------------------
 fill_home_app | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | 
 postgres      | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | 
 template0     | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | =c/postgres          +
               |          |          |            |            |            |                 | postgres=CTc/postgres
 template1     | postgres | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | =c/postgres          +
               |          |          |            |            |            |                 | postgres=CTc/postgres
(4 rows)
```

### 7. Readmeのmake create以降をたたく
