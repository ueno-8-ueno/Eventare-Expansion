# Eventare-Expansion

# 概要
過去に作成したイベント共有型TODOアプリ **"Eventare"** の刷新および機能拡張版です.

Dockerを用いた環境の作成や, Rails7にバージョンアップしたことなどが主な変更点です.

# 環境構築
バックグラウンドでのコンテナ起動(ビルドも兼ねる)
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