+++
title = 'Pythonのパッケージ管理ツールの比較 | Rye vs Poetry+pyenv'
subtitle = ""
date = 2024-07-20
lastmod = 2024-07-20
draft = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["Rye", "Poetry", "Python"]
categories = ["Setup"]
featuredImage = ""
featuredImagePreview = ""
isCJKLanguage = true
hiddenFromHomePage = false
hiddenFromSearch = false
twemoji = false
lightgallery = true
ruby = true
fraction = true
fontawesome = true
linkToMarkdown = true
rssFullText = false
+++

<!--more-->

## まとめ
| 項目 | Rye  | Poetry  |
|--------|-----------|----------------|
| Document| https://rye.astral.sh/  | https://python-poetry.org/docs/ |
| GitHub| https://github.com/astral-sh/rye  | https://github.com/python-poetry/poetry |
| Star数 | [![GitHub stars](https://img.shields.io/github/stars/astral-sh/rye.svg)]()  | [![GitHub stars](https://img.shields.io/github/stars/python-poetry/poetry.svg)]() |
| 実装言語 | Rust  | Python |
| 管理対象   | Pythonバージョン / パッケージ / 仮想環境  | パッケージ / 仮想環境 |
| 依存関係の管理   | pyproject.toml  | pyproject.toml |
| ロックファイル   | requirements.lock  | poetry.lock |


## 開発環境整備の手順と速度検証
- 各コマンドの速度検証には、Powershellのコマンド `Measure-Command {速度計測対象コマンド}` を使用
- 確認に使用したVersionは以下の通り
    - Python : 3.10.9
    - Rye : 0.1.0
    - Poetry : 1.6.1
    - virtualenv : 20.25.0

### Rye
> - RyeでPython 3.10.9はインストール済みの状態で速度を計測する
1. プロジェクトをRyeで管理
    - プロジェクトを新規作成する場合：`rye init {プロジェクト名}` → 0.3 秒
    - 既存プロジェクトを管理対象とする場合：`rye init` → 0.2 秒
    - すでにpyproject.toml, requirements.lockがある場合：`rye sync`
2. 仮想環境で使用するPythonバージョンの選択：`rye pin 3.10.9` → 0.1 秒
3. 選択したPythonバージョンで仮想環境を作成：`rye sync` → 2.5 秒
4. 仮想環境のアクティベート：`.\.venv\Scripts\activate` → 0.1 秒
5. 依存関係の追加：`rye add pandas` → 9.0 秒
6. ライブラリのインストール：`rye sync` → 0.5 秒
7. インストールしたライブラリの確認：`rye list`

### Poetry
> - pyenvでPython 3.10.9はインストール済みの状態で速度を計測する
> - Poetryの仮想環境は、内部的にはvirtualenvを使用している
1. 仮想環境をプロジェクト配下に作成する設定：`poetry config virtualenvs.in-project true --local` → 1.3 秒
2. プロジェクトをPoetryで管理
    - プロジェクトを新規作成する場合：`poetry new {プロジェクト名}` → 1.6 秒
    - 既存プロジェクトを管理対象とする場合：`poetry init` → 3.3 秒 (Enter連打)
    - すでにpyproject.toml, poetry.lockがある場合：`poetry install`
3. 仮想環境で使用するPythonバージョンの選択：`pyenv local 3.10.9` → 1.1 秒
4. 選択したPythonバージョンで仮想環境を作成：`poetry env use python` → 5.4 秒
5. 仮想環境のアクティベート：`.\.venv\Scripts\activate` → 0.1 秒
6. ライブラリのインストール：`poetry add pandas` → 15.5 秒
7. インストールしたライブラリの確認：`poetry show`

### (補足) venv/virtualenv
> - どちらも仮想環境を作成したいバージョンのPythonをインストールしておく必要がある

**venv**
> - Python 3.3以降のPythonにおいて、ビルトインされている機能のため、`pip install` が不要
> - 選択されているPythonインタープリターに対応した仮想環境を作成
1. 仮想環境の作成：`python3 -m venv venv` → 16.1 秒
2. 仮想環境のアクティベート：`.\venv\Scripts\activate` → 0.4 秒
3. ライブラリのインストール：`pip install pandas` → 61.8 秒
4. インストールしたライブラリの確認：`pip list`

**virtualenv**
> - Pythonのパッケージであり、`pip install virtualenv` でインストール
> - 任意のPythonバージョンを指定して仮想環境を作成可能
1. 仮想環境の作成：`python3 -m virtualenv -p python3.10 venv` → 5.0 秒
2. 仮想環境のアクティベート：`.\venv\Scripts\activate` → 0.1 秒
3. ライブラリのインストール：`pip install pandas` → 80.7 秒
4. インストールしたライブラリの確認：`pip list`


### 参考情報
- [Python パッケージ管理ツール比較: Poetry vs Pipenv vs Rye](https://qiita.com/owayo/items/142ac770d1a007e764a9)
- [pyenv+poetryで Python 仮想環境を作る](https://blog.deepblue-ts.co.jp/virtual_env/pyenv_poetry/)
- [Rust製のPythonパッケージ管理ツール「uv」を使ってみよう](https://gihyo.jp/article/2024/03/monthly-python-2403)
- [【Pythonのパッケージ管理に悩む方へ】パッケージ管理ツールRyeを使ってみた](https://dev.classmethod.jp/articles/get-start-rye-python/)
