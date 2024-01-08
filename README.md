# Eventare-Expansion

# 概要
過去に作成したイベント共有型TODOアプリ **[Eventare](https://github.com/ueno-8-ueno/Eventare "旧 Eventare")** の刷新および機能拡張版です.


Dockerを用いた環境の作成や, Rails7にバージョンアップしたことなどが主な変更点です.

# 主な拡張機能
**[旧 Eventare](https://github.com/ueno-8-ueno/Eventare "旧Eventare")** に追加実装した主な機能は以下となっております.
- 管理者機能
- 退会機能
- ジャンル機能
- イベント名/ジャンル検索機能

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