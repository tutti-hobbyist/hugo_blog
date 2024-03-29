+++
title = '2023年の振り返り'
subtitle = ""
date = 2024-01-01
lastmod = 2024-01-07
draft = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["振り返り"]
categories = ["語り"]
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

## 2023年のハイライト
### 本ブロブの開設
大学生の時に一度自己紹介ページは作製したものの、そこから更新作業を怠っていた。年末年始で何か新しいことをしたいなと思い、改めてサイトを開設した。今後は更新も積極的に行っていきたい。
<br>

### プロジェクトリード
もともとチームリーダーが担当していたタスクを、最初はOJT形式でチームリーダーと協業した。業務を行うために必要なドメイン知識やプロダクト仕様の大枠を掴んでからは、自分がメインでチームリーダーや協力会社のエンジニアとディスカッションをしつつ、タスクを回せるようになった。修正や機能追加についても積極的に提案し、客先評価で良い結果が期待できるくらいには、プロダクトの機能や精度が改善した。
<br>

### 英語実務経験
協力会社が米国を拠点としており、ミーティング・メール・ドキュメント作成を全て英語で実施している。もともと英語に苦手意識はなかったが、英語を使う頻度が飛躍的に増えたので、表現の幅の広がりや思いついたことを口に出すまでの速度の向上を感じる。
<br>

### 初めての海外出張
卒業旅行の時期とコロナの流行時期が丸被りした世代のため、そもそも海外すら行ったことがなかった。初めての海外 (韓国) ＋初めての客先工場という、とてもスリリングな出張だったが、無事計画していた現地評価を実施することが出来たので良かった。今回の出張で、自分の知らない場所に行くことの楽しさや対面でのコミュニケーションの重要性を改めて実感した。
<br>

### 特許提案
1年で2件の特許を提案し、申請手続きを完了することが出来た。まだ公開特許になっていないため、詳細を語ることはできないが、公開され次第、Linkと簡単な内容紹介をしようと思う。
<br>

### エンジニアリングの学習と実践
プロダクトで使用している技術のキャッチアップとプロダクトの改善のために、以下の項目の学習を行った。
- Python

    Pythonは修士研究時代からメインの言語として使用しているので、かれこれ5年弱経験がある。しかしながら、数値シミュレーションや機械学習での使用がほとんどで、並列処理やロガーなどソフトウェア開発に必要な知識や経験がほぼなかったため、これらの知識を勉強しつつ実装を行った。デザインパターンについても勉強した。

- Java

    修士研究の時に使用していたソフトウェアがJava製だったので、言語仕様を把握しておくために入門書を数冊読んだ程度の知識だった。ただPythonでclassや型ヒントを使った実装を行っていたので、Javaや静的型付け言語特有のお作法についても、違和感なく受け入れることが出来た。しかし、個人的には記述量が多くなるので、書いてて楽しいのはPythonだと思った。

- OpenAPI

    OpenAPI Specificationをyamlファイルで記述し、Swagger UIでAPIの動作確認をする方法を理解した。

- FastAPI

    もともとプロダクトは全てJavaで記述されていたが、機械学習関連ライブラリの豊富さと利便性を考慮して、学習部分のコードをPythonでマイクロサービスとして切り出すことに決まった。そのマイクロサービスの実装にFastAPIを使用した。

- Spring Boot

    プロダクトでSpring Bootが使用されているので、その仕組みを理解するために、書籍やUdemy講座で勉強した。簡単なToDoアプリの実装ができる程度には習得できた。

- SQL

    DBのデータを確認する際に書いた。

- PostgreSQL

    ダンプファイルの作成とリストアを行った。その業務を通して、テーブル・スキーマ・関数などの関係性をざっくり理解した。DBについてはもう少し知識を強化したいと思う。

- ELKスタック

    部署内の工数管理のためのBIツールをELKスタックで運用している。運用環境であるサーバーの更新に伴い、ELKスタックも別環境へリプレースする必要があり、その移行作業を行った。ELKスタックのConfigファイルやデータ授受の流れを理解し、移行作業を実施した。移行後も元の環境と同じ画面が表示され、レスポンス速度も同程度を維持していることを確認し、移行作業を完了した。また私用PCでもELKスタックを使って何か作りたいなと思い、[Elastic Stackで作るBI環境　Ver.7.4対応改訂版](https://nextpublishing.jp/book/11162.html)と[Pythonで作るはじめてのElasticsearchアプリケーション](https://www.amazon.co.jp/gp/product/B082ZTXBNZ/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B082ZTXBNZ&linkCode=as2&tag=chngng0103-22&linkId=2ee1701756b3640894b07857eefe1f45)を読んで、BI環境と書籍検索アプリを実装した。

- 数理最適化

    制約なし最適化・制約付き最適化・ベイズ最適化について、各手法の違いやユースケースを勉強した。プロダクトでは最適化対象の関数の概形が事前に予測できないため、汎用的な手法としてベイズ最適化を採用した。

- 推薦システム

    解析対象センサを自動で選択する方法として、推薦システムの適応を考えた。推薦システムの手法の調査と各手法の特長を理解したものの、推薦システムの仕組みを導入するためには、新規テーブルの設計と作成が必要なため、今年は実装を断念することとなった。近いうちにプロダクトに実装したい機能の1つ。

- 生存時間解析

    生存時間解析の分類 (ノンパラメトリック、セミパラメトリック、パラメトリック) と各手法の特長を理解し、線形回帰モデルの結果と比較した。

- 機械学習システムデザインパターン

    [AIエンジニアのための機械学習システムデザインパターン](https://www.shoeisha.co.jp/book/detail/9784798169453)を読んで勉強した。

- マイクロサービスアーキテクチャ

    [実践マイクロサービスAPI](https://www.shoeisha.co.jp/book/detail/9784798179735)を読んで勉強した。
<br>

## 2024年の目標
### エンジニアリングスキルの向上
- フロントエンドをJavaScript/TypeScript、バックエンドをPythonで書いたアプリを作成する。
- DBのテーブル設計や運用に関する知見を増やす。
- CS基礎力強化のため、低レイヤに関する知見を増やす。
<br>

### 英語力の向上
IELTSでオーバーオールスコア6.5以上を取得する。
<br>

### アメリカ出張
チャンスをもらえるように、日々の業務や自己研鑽を頑張り、上司に積極的にアピールする。
<br>
