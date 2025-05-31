# sample-dbt

このリポジトリは dbt Core のサンプルプロジェクトです。ディレクトリ構成は一般的な
ベストプラクティスに基づいており、モデル・マクロ・スナップショットなどを整理して
います。

`profiles.yml` はデータベース接続情報を含むため、`.gitignore` に追加してコミット
していません。各自の環境で設定してください。

## セットアップ

このプロジェクトでは Python 環境と依存ライブラリを [Poetry](https://python-poetry.org/)
で管理しています。次の手順で環境を構築してください。

```bash
# 依存関係のインストール
poetry install

# dbt コマンドの実行例
poetry run dbt --version
```

Python 3.12 で動作確認しています。
