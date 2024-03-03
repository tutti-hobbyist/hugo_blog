+++
title = 'HugoでKaTexを用いて数式を表示する手順'
subtitle = ""
date = 2024-03-03
lastmod = 2024-03-03
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

# 手順
1. `.\layouts\partials\head` に `apply-KaTex.html` (任意のファイル名) を作成し、以下コードをコピペ
    ```html
    <!-- Loading KaTex scripts extracted from https://katex.org/docs/browser.html -->
    <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/katex.min.css"
    integrity="sha384-vKruj+a13U8yHIkAyGgK1J3ArTLzrFGBbBc0tDp4ad/EyewESeXE/Iv67Aj8gKZ0"
    crossorigin="anonymous"
    />

    <!-- The loading of KaTeX is deferred to speed up page rendering -->
    <script
    defer
    src="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/katex.min.js"
    integrity="sha384-PwRUT/YqbnEjkZO0zZxNqcxACrXe+j766U2amXcgMg5457rve2Y7I6ZJSm2A0mS4"
    crossorigin="anonymous"
    ></script>

    <!-- To automatically render math in text elements, include the auto-render extension: -->
    <script
    defer
    src="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/contrib/auto-render.min.js"
    integrity="sha384-+VBxd3r6XgURycqtZ117nYw44OOcIax56Z4dCRWbxyPt0Koah1uHoK0o4+/RRE05"
    crossorigin="anonymous"
    onload="renderMathInElement(document.body);"
    ></script>

    <script>
    document.addEventListener("DOMContentLoaded", function() {
        renderMathInElement(document.body, {delimiters: [
        {left: "$$", right: "$$", display: true},
        {left: "$", right: "$", display: false}]
        });
    });
    </script>
    ```

2. `.\layouts\_default` の `baseof.html` の `<head>タグ` に以下コードをコピペ
    ```html
    {{- if .Params.useKaTex}} {{- partial "head/apply-KaTex.html" . -}} {{- end }}
    ```

3. `index.md` のフロントマターに `KaTex` のパラメータを追加し、数式を用いたい記事のみ `true` を設定

# 参考情報
- [HugoでKaTeX](https://blog.atusy.net/2019/05/09/katex-in-hugo)
- [Hugoで数式を書けるようにKaTexを導入する](https://blog.takanabe.tokyo/2023/02/08c885eb-04d0-468d-b710-ca1b6d0b3c92/)
- [Supported Functions](https://katex.org/docs/supported.html)