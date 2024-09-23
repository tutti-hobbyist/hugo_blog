+++
title = 'Cursorの使い方'
subtitle = ""
date = 2024-09-23
lastmod = 2024-09-23
draft = false
KaTex = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["Cursor"]
categories = ["Cursor"]
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

# シンボル機能
Chat画面で `@` を入力すると、シンボル機能が表示される

## ワークスペース内
  - Codebase: プロジェクト全体のコードベースを参照したい時に使用
  - Folders: 特定のフォルダ内のファイル一覧や構造を参照したい時に使用
  - Files: 特定のファイルの内容を参照したい時に使用
  - Code: 特定のコードブロック、関数、クラスなどを参照したい時に使用
  - Git: Gitリポジトリの情報を参照したい時に使用

## ワークスペース外
  - Web: ウェブ上の情報やリソースを参照したい時に使用
  - Docs: ドキュメントを参照したい時に使用

# ショートカット (自作定義含む)
| ショートカット | 機能                       |
| -------------- | -------------------------- |
| Ctrl+N         (自作) | 新規ファイルの作成         |
| Ctrl+Shift+N   (自作) | 新規フォルダの作成         |
| Ctrl+Alt+N     (自作) | 新規ウィンドウの表示       |
| Tab            (自作) | サジェスト選択             |
| Shift+Tab      (自作) | サジェスト選択（逆方向）   |
| Ctrl+Tab       (自作) | タブの移動                 |
| Ctrl+Shift+Tab (自作) | タブの移動（逆方向）       |
| Ctrl+Alt+Down  (自作) | ターミナルにカーソル移動   |
| Ctrl+Alt+Left  (自作) | 左側エディタにカーソル移動 |
| Ctrl+Alt+Right (自作) | 右側エディタにカーソル移動 |
| Ctrl+L | Chat画面の表示 |
| Ctrl＋K | 選択範囲に対して、Edit機能の表示 (Chat画面の `/edit` と同様の機能) |

## 注記
- 一部のショートカットは、既存のショートカットを上書きしている (詳細は[こちらのリポジトリ](https://github.com/tutti-hobbyist/.vscode/blob/main/keybindings.json.default))
- Cursor標準の `Ctrl+Shift+L` のショートカット (`aichat.insertselectionintochat`) は、`Select All Matches` 機能との重複を避けるために削除している
