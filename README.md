# はじめに
単語当てゲームををRubyで実装しました。  

基本仕様については実装完了しており、`HangmanGame`クラスと`InputValidator`モジュールのテストも実装しています。  
拡張仕様は、「ゲーム終了時に、正解の単語を表示する」については実装しました。
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

## 参考

- [使えるRSpec入門・その2「使用頻度の高いマッチャを使いこなす」](https://qiita.com/jnchito/items/2e79a1abe7cd8214caa5)
- [使えるRSpec入門・その3「ゼロからわかるモック（mock）を使ったテストの書き方」](https://qiita.com/jnchito/items/640f17e124ab263a54dd)
- [[Ruby] よく使うRspecのレシピ集（Rspec3.3）
](https://dev.classmethod.jp/articles/rspec-recipe/)
- [Ruby の定数やfreeze の扱い方が難しい
](https://yulii.github.io/ruby-freeze-method-20150922.html)
- [teratail](https://teratail.com/questions/285790)
- [【RSpec】RubyのみでRSpecを用いる方法について簡単にまとめてみた【Railsなし】](https://techtechmedia.com/ruby-setup-rspec/)
- [Dockerを使ってRubyの開発環境を構築してみました](https://zenn.dev/bloomer/articles/98df661f7c339e)
- [ゼロからわかる Ruby 超入門（書籍）](https://gihyo.jp/book/2018/978-4-297-10123-7)
