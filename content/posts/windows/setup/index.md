+++
title = '【個人用】Windowsの設定'
subtitle = ""
date = 2024-09-21
lastmod = 2024-09-21
draft = false
KaTex = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["Windows", "設定"]
categories = ["Windows"]
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

# セットアップ内容
## システム設定
- タスクバーの設定
- 電源 & スリープの設定
- システムデバイスの設定

## スタートアップ時の起動ソフトの整理
- スタートアップ時に起動したいソフトの実行ファイルのショートカットをスタートアップフォルダに配置

## タスクバーの表示日時の設定
> 最新版の `tclocklight-kt240522` は、Windows 11では動作しない ([参照](https://github.com/k-takata/TClockLight/releases/tag/tclocklight-kt240522))
- `TClock Light` のインストール
  - [ダウンロード先](https://github.com/k-takata/TClockLight/releases)
  - [手順の説明](https://akiyamas.net/tclock/)
- PC起動時の自動スタートアップ設定
  - スタートアップフォルダに `tclock.exe` のショートカットを配置 ([参照](https://akiyamas.net/tclock/#toc4))
  - (上の方法でうまくいかない場合) タスク スケジューラによる起動 ([参照](https://www.atsushifukuda.jp/articles/how-to-start-tclock-light-on-startup-windows-10/))

## Outlook
- 表示設定
  - フォントサイズ
  - プレビュー内容
  - プレビュー表示の位置
- フォルダ作成
- カレンダー設定
  - タイムスケールの設定
  - 稼働日と稼働時間の設定
  - 祝日の表示

## 拡張機能の設定
- [ChatHub](https://chromewebstore.google.com/detail/chathub-gpt-4%E3%80%81gemini%E3%80%81clau/iaakpnchhognanibcahlpcplchdfmgma?hl=ja)：複数の生成AIモデルを１元管理
- [Language Reactor](https://chromewebstore.google.com/detail/Language%20Reactor/hoombieeljmmljlkjmnheibnpciblicm?hl=ja)：動画に翻訳を表示
- [Smallpdf](https://chromewebstore.google.com/detail/smallpdf-%E2%80%94-pdf%E3%81%AE%E7%B7%A8%E9%9B%86%E3%80%81%E5%A4%89%E6%8F%9B%E3%80%81%E5%9C%A7%E7%B8%AE%E3%80%81a/ohfgljdgelakfkefopgklcohadegdpjf)：PDFの編集
- [Web Maker](https://chromewebstore.google.com/detail/web-maker/lkfkkhfhhdkiemehlpkgjeojomhpccnh)：Webサイトの動的作成
- [Web時間統計](https://chromewebstore.google.com/detail/web%E6%99%82%E9%96%93%E7%B5%B1%E8%A8%88/dkdhhcbjijekmneelocdllcldcpmekmm)：Webサイトの滞在時間を計測
- [Keepa](https://chromewebstore.google.com/detail/keepa-amazon-price-tracke/neebplgakaahbhdphmkckjjcegoiijjo?hl=ja)：Amazonの商品の価格を記録
- [Sakura Check Linker](https://chromewebstore.google.com/detail/sakura-check-linker/dmelpckhjikcpmppkcnjmjmedhjpjmce?hl=ja)：Amazonのレビューチェック
- [OneTab](https://chromewebstore.google.com/detail/onetab/chphlpgkkbolifaimnlloiipkdnihall)：開いているタブをまとめて管理
- [uBlock Origin](https://chromewebstore.google.com/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)：広告の表示を抑止
- [uAutoPagerize](https://chromewebstore.google.com/detail/uautopagerize/kdplapeciagkkjoignnkfpbfkebcfbpb)：ページの自動スクロール
- [Quick Custom GSearch](https://chromewebstore.google.com/detail/quick-custom-gsearch/dcdmfmmmmpjgfaffnaokjpifnihmhaon)：Google検索のカスタム検索
- [Video Speed Controller](https://chromewebstore.google.com/detail/video-speed-controller/nffaoalbilbmmfgbnbgppjihopabppdk)：動画の再生速度を変更
- [FireShot](https://chromewebstore.google.com/detail/%E3%82%A6%E3%82%A7%E3%83%96%E3%83%9A%E3%83%BC%E3%82%B8%E5%85%A8%E4%BD%93%E3%82%92%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88-firesh/mcbpblocgmgfnpjjppndjkmgjaogfceg)：Webページのスクリーンショットを撮影
- [Page Edit](https://chromewebstore.google.com/detail/page-edit/clfiicjcpkcccglblehapeiipibnaenl)：Webページの編集
- [Weava Highlighter](https://chromewebstore.google.com/detail/weava-highlighter-pdf-web/cbnaodkpfinfiipjblikofhlhlcickei)：Webページのハイライト
- [Super Highlight Search](https://chromewebstore.google.com/detail/super-highlight-search/mnnlboenenpikhopbchpjikllhibfocl)：Webページの文字列検索
- [Save to Notion](https://chromewebstore.google.com/detail/save-to-notion/ldmmifpegigmeammaeckplhnjbbpccmm)：Webページの情報をNotionへシームレスに保存
- [Notion Boost](https://chromewebstore.google.com/detail/notion-boost/eciepnnimnjaojlkcpdpcgbfkpcagahd)：Notionの操作を便利に

## エディタの設定
- `Cursor` のインストール
  - [ダウンロード先](https://www.cursor.com/)
  - 設定ファイルの更新 ([参照](https://tutti-hobbyist.github.io/hugo_blog/posts/vscode/settings/#%E8%A8%AD%E5%AE%9A%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB))
  - 拡張機能のインストール ([参照](https://tutti-hobbyist.github.io/hugo_blog/posts/vscode/settings/#%E6%8B%A1%E5%BC%B5%E6%A9%9F%E8%83%BD%E3%81%AE%E7%AE%A1%E7%90%86%E6%96%B9%E6%B3%95))
    - Powershellのスクリプトを使用して、拡張機能をインストールする際に、以下のようなエラーが出る場合は、実行ポリシーを変更する必要がある
      ```text
      .\install-vscode-extensions.ps1 : このシステムではスクリプトの実行が無効になっているため、ファイル C:\Users\{username}\my-env\settings\vscode-extensions\install-vscode-extensions.ps1 を読み込むことができません。詳細については、「about_Execution_Policies」(https://go.microsoft.com/fwlink/?LinkID=135170) を参照してください。

      発生場所 行:1 文字:1
      .\install-vscode-extensions.ps1
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        CategoryInfo          : セキュリティ エラー: (: ) []、PSSecurityException
        FullyQualifiedErrorId : UnauthorizedAccess
      ```
      - 実行ポリシーを確認するためのコマンド：`Get-ExecutionPolicy -List`  
        出力例
        ```text
        Scope ExecutionPolicy
        ----- ---------------
        MachinePolicy      Undefined
          UserPolicy       Undefined
              Process      Undefined
          CurrentUser      Undefined
        LocalMachine       Undefined
        ```
      - 実行ポリシーを変更するためのコマンド：`Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

## 画面分割ソフトの設定
- `Microsoft PowerToys` のインストール
  - [手順の説明](https://learn.microsoft.com/ja-jp/windows/powertoys/install)
  - [機能概要の一覧](https://learn.microsoft.com/ja-jp/windows/powertoys/#current-powertoy-utilities)
    - 特に便利な機能
      - [Advanced Paste](https://learn.microsoft.com/ja-jp/windows/powertoys/advanced-paste)
      - [Color Picker](https://learn.microsoft.com/ja-jp/windows/powertoys/color-picker)
      - [Fancy Zones](https://learn.microsoft.com/ja-jp/windows/powertoys/fancyzones)
      - [File Locksmith](https://learn.microsoft.com/ja-jp/windows/powertoys/file-locksmith)
      - [Image Resizer](https://learn.microsoft.com/ja-jp/windows/powertoys/image-resizer)
      - [Mouse Utilities](https://learn.microsoft.com/ja-jp/windows/powertoys/mouse-utilities)
      - [Power Rename](https://learn.microsoft.com/ja-jp/windows/powertoys/powerrename)
      - [Text Extractor](https://learn.microsoft.com/ja-jp/windows/powertoys/text-extractor)
  - `FancyZones` で任意の画面分割を設定

## 倍速再生ソフトの設定
- `Meru` のインストール
  - [概要説明](https://www.douga-soft.com/freesoft/free0116.html)
  - [ダウンロード先](https://hp.vector.co.jp/authors/VA035069/products.htm)
