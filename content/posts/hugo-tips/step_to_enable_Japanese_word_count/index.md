+++
title = 'Hugoで日本語ワードカウントを有効にする手順'
subtitle = ""
date = 2024-01-10
lastmod = 2024-01-10
draft = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["Hugo"]
categories = ["Hugo"]
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

### 手順
1. `hugo.toml` 内に以下記述を追記
    ```hugo.toml
    hasCJKLanguage = true
    ```
<br>

2. Front matterで `isCJKLanguage` を `true` に設定 (.mdのページごとに設定を行いたい場合)
    ```markdown
    ---
    title: "記事のタイトル"
    date: "2017-08-29"
    ...
    isCJKLanguage: true
    ...
    ---

    本文... 
    ```


### 参考情報
- [Hugo で日本語を正しく扱えるようにしてページサマリーが長くなるのを防ぐ](https://maku77.github.io/p/rqcwgyj/)