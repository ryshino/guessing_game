# はじめに
単語当てゲームををRubyで実装しました。

## 開発環境
- Docker
- Ruby 3.2.2

## ゲームプレイまでのセットアップ手順
以下のコマンドを順に実行してください。
```bash
git clone https://github.com/ryshino/guessing_game.git
```
```
cd guessing_game
```
Dockerイメージのビルド
```
make build
```
コンテナの起動
```
make up
```
コンテナ内のシェルに入る
```
make bash
```
ゲームの開始
```
ruby play.rb
```
## テストの実行
```bash
make test
```
