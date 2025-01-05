+++
title = 'Syntax | Markdownの記述で使用する構文'
subtitle = ""
date = 2024-01-05T16:16:39+09:00
lastmod = 2024-01-05T16:16:39+09:00
draft = true
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["Markdown", "構文"]
categories = ["Tips"]
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

## 情報まとめページ
https://hugoloveit.com/

### note
{{< admonition note "Title" >}}
Sentence.
{{< /admonition >}}

### tip
{{< admonition tip "Title" >}}
Sentence.
{{< /admonition >}}

### 網掛け
`Sentence.`

### スクリプト
```bash
Script
```
- **Web関連**:
  - `html`, `xml`, `css`, `javascript`, `typescript`, `json`, `markdown`

- **プログラミング言語**:
  - `python`, `ruby`, `perl`, `php`, `java`, `c`, `cpp`, `csharp`, `go`, `rust`, `swift`, `kotlin`
  
- **スクリプト言語**:
  - `bash`, `shell`, `zsh`, `powershell`

- **データフォーマット**:
  - `yaml`, `toml`, `ini`, `csv`

- **データベース言語**:
  - `sql`, `postgresql`, `mysql`

- **その他**:
  - `dockerfile`, `makefile`, `diff`, `git`

### テーブル
| Col1 | Col2 |
|:------ |:-----:|
|Hoge|Huga|

### Tweet挿入
- 挿入したいツイートのLink
https://twitter.com/SanDiegoZoo/status/1453110110599868418
- マークダウン記述方法
{{< tweet user="SanDiegoZoo" id="1453110110599868418" >}}

### YouTube挿入
- 挿入したいツイートのLink
https://www.youtube.com/watch?v=w7Ft2ymGmfc
- マークダウン記述方法
{{< youtube w7Ft2ymGmfc >}}

### チェックボックス
- [ ] Test1
- [x] Test2
- [ ] Test3

### 脚注
This is a digital footnote[^1].
This is a footnote with "label"[^label]

[^1]: This is a digital footnote
[^label]: This is a footnote with "label"
