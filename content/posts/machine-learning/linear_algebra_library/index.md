+++
title = 'NumPy高速化を目指して'
subtitle = ""
date = 2024-02-23
lastmod = 2024-08-06
draft = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["Machine Learning", "線形代数"]
categories = ["Machine Learning"]
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

# 背景
業務で計算速度高速化を目指している際に、線形代数ライブラリに関する言及をいくつか見つけたので、備忘録としてまとめておく

# まとめ
## 線形代数ライブラリの概要
1. 線形代数ライブラリとは、以下2つをパッケージングしたライブラリ
    - BLAS (Basic Linear Algebra Subprograms)：ベクトルと行列のかけ算や足し算を担う
    - LAPACK (Linear Algebra PACKage)：連立線型方程式や固有値方程式、特異値分解の解法を担う
<br>

1. BLASとLAPACKは数値計算を行うソフトウェアの大部分で使用されている
    - Python (NumPy, SciPy)
    - MATLAB
    - R
    - TensorFlow
    - etc...
<br>

1. BLASで定義される演算には、Level 1 BLAS、Level 2 BLAS、Level 3 BLASという分類があり、**より高いLevelのBLASを利用したほうが効率よく計算できる**
    - Level 1 BLAS：ベクトルとベクトルの演算
    - Level 2 BLAS：行列とベクトルの演算
    - Level 3 BLAS：行列と行列の演算
<br>

1. 線形代数ライブラリは、アセンブリ言語で実装されているソフトウェアが多いので、**使用するコンピュータのアーキテクチャに対応したライブラリを選ぶ必要がある**
<br>

1. DGEMM (BLASに含まれる行列積計算ルーチン) は高性能比較のベンチマークによく用いられる
<br>

## 主要線形代数ライブラリ
### BLAS/LAPACK
- Netlib公式参照実装
- DGEMM：理論最高性能の 10 % 程度
- パブリックドメインライセンスで自由に利用可能

### ATLAS
- パラメータサーベイによって BLASを自動チューニングする実装
- DGEMM：理論最高性能の 80 % 程度
- BSDライセンスのオープンソース

### MKL
- Intel製の数値計算ライブラリ
- DGEMM：理論最高性能の 96~97 % 程度
- 有料
<br>

## NumPy高速化のTips
- **NumPyの関数を出来るだけ使用** (どうしてもforループから逃げられない場合のみNumba等を検討 ([参考記事](https://okumuralab.org/~okumura/python/numba.html)))
    {{< gist tutti-hobbyist a49f5e1c9c422b9f904a1dc0343498ca >}}
- 行列の演算は、NumPyの中で利用されているBLASを意識しないと、本来のパフォーマンスを出すことができない (≒ **forループの排除**)
- インプレイス演算 (a += b) で **ミュータブルオブジェクトを更新** ([説明記事](https://qiita.com/tsal3290s/items/d8e05dc135dd872993b6))

# 参考情報
- [線形代数ライブラリ](https://note.com/ymzo76/n/n289ad86271c4)
- [NumPyではLevel 3 BLASを活かして高速化しよう](https://recruit.cct-inc.co.jp/tecblog/machine-learning/numPy-01/)
- [NumPyとSciPyを高速に動かす](https://hackmd.io/@bPWt-odDSNe3X1LQdK606Q/HJnjU5mrB)
- [高速化Tips](https://kyotogeopython.zawawahoge.com/html/%E5%BF%9C%E7%94%A8%E7%B7%A8/%E9%AB%98%E9%80%9F%E5%8C%96Tips.html)
- [NumPyによる数値計算の高速化 : 基礎](https://qiita.com/jabberwocky0139/items/c3620fb2f011f20a633b#fnref3)
- [NumPy・SciPyを用いた数値計算の高速化 : 応用その1](https://qiita.com/jabberwocky0139/items/a9751d11caa64bc19226)
- [NumPy・SciPyを用いた数値計算の高速化 : 応用その2](https://qiita.com/jabberwocky0139/items/26451d7942777d0001f1)
- [The Art of Linear Algebra](https://github.com/kenjihiranabe/The-Art-of-Linear-Algebra/blob/main/The-Art-of-Linear-Algebra.pdf)
- [線形代数演算ライブラリBLASとLAPACKの基礎と実践 (I) BLAS, LAPACK入門編](https://www.r-ccs.riken.jp/wp/wp-content/uploads/2020/09/nakata190523.pdf)
