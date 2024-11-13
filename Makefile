.PHONY: up down build bash test

# コンテナの起動
up:
	docker compose up -d

# コンテナの停止
down:
	docker compose down

# コンテナのビルド
build:
	docker compose build

# コンテナに入る
bash:
	docker compose exec app bash

# テストの実行
test:
	docker compose exec app bundle exec rspec

# コンテナの再起動
restart: down up

# コンテナのリビルド
rebuild: down build up

# ログの表示
logs:
	docker compose logs -f