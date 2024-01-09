# Eventare-Expansion

# 概要
過去に作成したイベント共有型TODOアプリ **[Eventare](https://github.com/ueno-8-ueno/Eventare "旧 Eventare")** の刷新および機能拡張版です.


# 主な変更点・拡張機能
**[旧 Eventare](https://github.com/ueno-8-ueno/Eventare "旧Eventare")** からの主な変更点, 拡張機能は以下の通りです.

## 変更点
- 環境構築にDockerを使用
- Rails6からRails7に変更
- DBをMySQLに変更

## 拡張機能
- 管理者機能
- 退会機能
- ジャンル機能
- イベント名/ジャンル検索機能
- 絞り込み機能(完了/未済)

# 環境構築
imageおよびコンテナの構築, バックグラウンドでのコンテナ起動
```bash
$ docker-compose up -d --build
```

データベースの作成
```bash
$ docker-compose exec web rails db:create
```

プリコンパイル
```bash
$ docker-compose exec web rails assets:precompile
```

# コンテナ起動後
アプリへのアクセス: http://localhost:3000

# 使用技術
## フロントエンド
- Bootstrap

## バックエンド
- Ruby on Rails (Ruby)

## DB/インフラ
- MySQL
- Docker