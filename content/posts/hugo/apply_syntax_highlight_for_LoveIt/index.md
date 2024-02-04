+++
title = 'HugoのLoveItテーマでSynatx Highlightにスクロールバーを適用する方法'
subtitle = ""
date = 2024-02-04
lastmod = 2024-02-04
draft = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["Hugo", "LoveIt"]
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
1. CSSにスクロールバーの設定を追加
    `assets\css\_partial\_single\_code.scss` 内の `.chroma` クラスに以下設定を追加 (設定する数値はお好みで)
    - `font-size`：`.chroma` 内のテキストのフォントサイズ
    - `max-height`：`.chroma` の高さ制限 (高さ超過時、縦方向にスクロールバーが表示される)
    - `overflow-x`：`scroll` を指定し、横方向のスクロールバーを表示
    - `overflow-y`：`scroll` を指定し、縦方向のスクロールバーを表示
    - `padding`：`.chroma` 内のコンテンツと `.chroma` 要素の境界に余白追を追加
    
    ```CSS
    .chroma {
        font-size: 13px;
        max-height: 600px;
        overflow-x: scroll;
        overflow-y: scroll;
        padding: 2px 5px;
    }
    ```
<br>

2. Chroma SyntaxHighlightの有効化
    `hugo.toml` ファイルに以下設定を追加
    ```TOML
    pygmentsUseClasses = true
    pygmentsCodefences = true
    ```
<br>

### 参考情報
- [HugoのSyntaxHighlight](https://hugo-de-blog.com/hugo-syntax/)
- [シンタックスハイライト](https://garretlab.web.fc2.com/hugo/contents/syntax_highlight/)
- [Syntax highlighting](https://gohugo.io/content-management/syntax-highlighting/)
- [alecthomas/chroma](https://github.com/alecthomas/chroma)