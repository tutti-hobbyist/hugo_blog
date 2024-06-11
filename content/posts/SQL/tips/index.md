+++
title = 'SQLのTips'
subtitle = ""
date = 2024-05-29
lastmod = 2024-05-29
draft = true
KaTex = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["SQL"]
categories = ["SQL"]
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

# Tps
## [WITH句かサブクエリか](https://knknkn.hatenablog.com/entry/2018/03/21/031231)
- WITH句のメリット
    - 可読性が高くなる
    - 同じ処理を使いまわせる (→ 修正する場合も1か所の修正で済む)
    - WITH句で生成したデータは、クエリ内セッションではメモリ（尽きたらディスク）に保存されるため、同じ処理の場合、メモリから生成済みデータを流用できる
- サブクエリのメリット
    - サブクエリのデータはメモリに保存されることなく、都度生成されるため、大容量データを作成し続けるようなクエリを作る場合のみ有効 (ただし、CREAT TABLEするのが一般的)


