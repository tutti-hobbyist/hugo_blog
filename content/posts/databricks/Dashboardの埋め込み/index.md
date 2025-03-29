+++
tite = 'Databricks Dashboardの埋め込み表示の備忘録'
subtitle = ""
date = 2025-03-27
lastmod = 2025-03-27
draft = false
KaTex = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["Databricks", "ダッシュボード"]
categories = ["Databricks"]
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

# 参考リンク
- [ダッシュボードを埋め込む](https://docs.databricks.com/aws/ja/dashboards/embed)
- [クリックジャッキングとその対策について調べた件](https://zenn.dev/arsaga/articles/66a59c3be422d3)

# まとめ
## 背景
某案件にて、Databricks上で作成したDashboardをフロントエンドに埋め込んで、Databricksにアクセスせずとも画面を確認できるようにしたいという要望があった。

## 確認事項
### 手順
1. ダッシュボードの作成
2. ダッシュボードの埋め込み画面の生成方法の確認
3. 埋め込みの動作確認

### わかったこと
- ダッシュボードはiframeとして埋め込むことが可能だが、このとき埋め込みコードを追記したHTMLファイルをローカルファイルから、直接表示しようとしても、埋め込み画面が表示されない
- ディベロッパーツールでエラー内容を確認してみると、frame-ancestors (HTMLをホストしているサーバー) に **http, https, ws, wssプロトコルで接続** する必要があるとのこと
- ローカルでWebサーバーを立てて、HTMLファイルを読み込んで、https接続してみたところ、無事埋め込み画面が表示され、ダッシュボードがインタラクティブに動作することを確認できた
