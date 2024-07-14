+++
title = 'Welford法の概要'
subtitle = ""
date = 2024-02-23
lastmod = 2024-07-14
draft = true
KaTex = true
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["Machine Learning", "Welford法"]
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

## 背景
業務である期間のストリームデータに対して、平均と分散を計算する方法を調査していたところ、`Welford法` というアルゴリズムを知ったので、一般的な計算方法との違いや実プログラムを用いた比較を行ってみる。

## 1. 一般的な不偏分散の計算式
\[
S^2 = \frac{1}{n-1} \sum_{i=1}^{n} (x_i - \bar{x})^2
\]

> \(S^2\) : 不偏分散
> \(n\) : 観測データ数
> \(x_i\) : i番目の観測値
> \(\bar{x}\) : 全データの平均値

しかしながら、本実装では観測データが更新される度に平均と偏差を出し直さなくてはならず、O(\(n\))の計算量が必要になり、\(n\)サンプルまでこれを繰り返すと結果的にO(\(n^2\))の計算量が必要であるため、**分散の逐次更新には適していない**。
<br>

## 2. 逐次更新可能な不偏分散の計算式
一般的な不偏分散の計算式に関して式変形を行い、観測データ更新時の計算量を定数にできれば、全体の計算量をO(\(n\))に出来る。

\[
\begin{align*}
S^2 &= \frac{1}{n-1} \sum_{x=1}^{n} (x_i - \bar{x})^2 \\
&= \frac{1}{n-1} \sum_{x=1}^{n} (x_i^2 - 2x_i \bar{x} + \bar{x}^2) \\
&= \frac{1}{n-1} \left( \sum_{x=1}^{n} x_i^2 - 2\bar{x} \sum_{x=1}^{n} x_i + n\bar{x}^2 \right) \\
&= \frac{1}{n-1} \left( \sum_{x=1}^{n} x_i^2 - 2n\bar{x}^2 + n\bar{x}^2 \right) \\
&= \frac{1}{n-1} \left( \sum_{x=1}^{n} x_i^2 - n\bar{x}^2 \right) \\
&= \frac{1}{n-1} \left( \sum_{x=1}^{n} x_i^2 - \frac{1}{n} \left( \sum_{x=1}^{n} x_i \right)^2 \right) \\
\end{align*}
\]

以上より、観測データの総和と二乗和の計算結果を保持しておくことで、新しい観測データを受け取った際も、定数時間で更新後の分散を計算することができる。しかし、**サンプル数が増⼤したときに、この計算方法は成立しなくなる**。本来、不偏分散はデータ数に依らない⺟分散に収束するため、サンプル開始時からずっとその真値は変化しない。しかし、実計算上は、データ数の増大に伴い、総和と二乗和が増⼤するため、**桁落ち誤差が生じてしまう**。

## 3. Welford法
桁落ち誤差が生じない不偏分散の更新方法として、Welford法がある。この方法は平均と不偏分散を漸化式により計算する。

### 平均の漸化式
\[
\begin{align*}
\overline{x_{n+1}} - \overline{x_n} &= \frac{1}{n+1}\sum_{x=1}^{n+1}x_i - \frac{1}{n}\sum_{x=1}^{n}x_i\\
&= \frac{1}{n+1}{\left(x_{n+1} + \sum_{x=1}^{n}x_i\right)} - \frac{1}{n}{\sum_{x=1}^{n}x_i}\\
&= \frac{1}{n+1}{\left(x_{n+1} + \sum_{x=1}^{n}x_i - \frac{n+1}{n}\sum_{x=1}^{n}x_i\right)}\\
&= \frac{1}{n+1}{\left(x_{n+1} - \frac{1}{n}\sum_{x=1}^{n}x_i\right)}\\
&= \frac{1}{n+1}{\left(x_{n+1} - \overline{x_n}\right)}
\end{align*}
\]

### 不偏分散の漸化式
$M_n = (n − 1)S_n^2$ …(1) として、$M_n$ を漸化式で計算する。

\[
\begin{align*}
M_{n+1} - M_n &= nS_{n+1}^2 - (n-1)S_n^2 \\
&= \frac{n}{n} \sum_{x=1}^{n+1} (x_i - \overline{x_{n+1}})^2 - \frac{n-1}{n-1} \sum_{x=1}^{n} (x_i - \overline{x_n})^2 \\
&= \sum_{x=1}^{n+1} \left(x_i^2 - 2x_i \overline{x_{n+1}} + \overline{x_{n+1}}^2\right) - \sum_{x=1}^{n} \left(x_i^2 - 2x_i \overline{x_n} + \overline{x_n}^2\right)\\
&= \sum_{x=1}^{n+1} x_i^2 - 2 \overline{x_{n+1}} \sum_{x=1}^{n+1} x_i + (n+1) \overline{x_{n+1}}^2 - \sum_{x=1}^{n} x_i^2 + 2 \overline{x_n} \sum_{x=1}^{n} x_i - n \overline{x_n}^2\\
&= x_{n+1}^2 - 2 \overline{x_{n+1}} \sum_{x=1}^{n+1} x_i + (n+1) \overline{x_{n+1}}^2 + 2 \overline{x_n} \sum_{x=1}^{n} x_i - n \overline{x_n}^2 \\
&= x^2_{n+1} - 2\overline{x_{n+1}}(n + 1)\overline{x_{n+1}} + (n + 1)\overline{x_{n+1}}^2 + 2\overline{x_{n}}n\overline{x_{n}} - n\overline{x_{n}}^2 \\
&= x^2_{n+1} - 2(n + 1)\overline{x_{n+1}}^2 + (n + 1)\overline{x_{n+1}}^2 + 2n\overline{x_n}^2 - n\overline{x_n}^2 \\
&= x^2_{n+1} - (n + 1)\overline{x_{n+1}}^2 + n\overline{x_n}^2 \\
&= x^2_{n+1} - (n + 1)(\overline{x_{n+1}}^2 - \overline{x_n}^2) - \overline{x_n}^2 \\
&= x^2_{n+1} - (n + 1)(\overline{x_{n+1}} + \overline{x_n})(\overline{x_{n+1}} - \overline{x_n}) - \overline{x_n}^2 \\
&= x^2_{n+1} - (n + 1)(\overline{x_{n+1}} + \overline{x_n})\frac{1}{n+1}(x_{n+1} - \overline{x_n}) - \overline{x_n}^2 \\
&= x_{n+1}^2 - \left(\overline{x_{n+1}} + \overline{x_n}\right) \left(x_{n+1} - \overline{x_n}\right) - \overline{x_n}^2 \\
&=  \left(x_{n+1} - \overline{x_{n+1}}\right) \left(x_{n+1} - \overline{x_n}\right)
\end{align*}
\]

$\overline{x_{n+1}}$ と $\overline{x_n}$ は平均の漸化式から求まるため、$M_n$の漸化式を得たことになる。(1)式より不偏分散は $M_n$ を $n-1$ で割れば良いので、これで不偏分散の逐次更新ができるようになった。⼤抵の場合は $x_{n+1}$ , $\overline{x_{n+1}}$ , $\overline{x_{n}}$ は同程度の数値なので、桁落ち誤差が発⽣しなくなり、高い計算精度が期待できる。実際に単純な変形をした2の⽅法よりも精度が良い。

## 参考情報
- [平均値と分散の逐次計算(オンラインアルゴリズム)](https://qiita.com/cartooh/items/2e4c9a9c4727d47d3937)
- [分散や標準偏差のオンライン計算 → Welfordアルゴリズム](https://blog.data-hacker.net/2020/11/welford.html)
- [Algorithms for calculating variance](https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance)
- [Comparing three methods of computing standard deviation](https://www.johndcook.com/blog/2008/09/26/comparing-three-methods-of-computing-standard-deviation/)