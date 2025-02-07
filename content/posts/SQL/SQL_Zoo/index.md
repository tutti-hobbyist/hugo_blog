+++
title = 'SQLの構文まとめ'
subtitle = ""
date = 2025-01-28
lastmod = 2025-01-28
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

## 基本構文
- 記述順序
    ```sql
    SELECT * FROM table;
    ```

## 条件式
- 複数の条件
    ```sql
    IF (col_a is NULL, 'None', IF(col_a = col_b, 'correct', 'incorrect'));
    ```

- 複数の条件 (CASE)
    ```sql
    -- SQL Zoo JOIN 13
    SELECT 
    mdate,
    team1,
    SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
    team2,
    SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
    FROM game JOIN goal ON id = matchid
    GROUP BY mdate, team1, team2
    ORDER BY mdate, matchid;
    ```

## フィルタリング
- 単純な条件
    ```sql
    WHERE col_a = 'hoge';
    WHERE col_a != 'hoge';
    WHERE col_a IN ('a', 'b', 'c');
    WHERE col_a BETWEEN a AND b;
    ```

- XOR
    ```sql
    SELECT name, population, area
    FROM world
    WHERE (area > 3000000 OR population > 250000000)
    AND NOT (area > 3000000 AND population > 250000000);
    ```


- ALL
  - 全ての中で最大/最小
    ```sql
    SELECT name
    FROM world
    WHERE population >= ALL(SELECT COALESCE(population, 0)
                           FROM world
                          WHERE population>0);
    ```
    ```sql
    -- 国の人口が同じ大陸の隣国すべての人口の3倍より大きい国
    SELECT w1.name, w1.continent
    FROM world w1
    WHERE w1.population > ALL(
        SELECT 3 * w2.population
        FROM world w2
        WHERE w1.continent = w2.continent
        AND w1.name != w2.name
    );
    ```

  - あるグループの中で最大/最小
    ```sql
    -- ALL を使う方法
    SELECT continent, name, area FROM world x
    WHERE area >= ALL(
        SELECT area FROM world y 
        WHERE y.continent=x.continent 
        AND population>0);
    
    -- ALL を使わない方法
    SELECT continent, name, area
    FROM world w1
    WHERE area = (
        SELECT MAX(area)
        FROM world w2
        WHERE w1.continent = w2.continent
    );
    ```

- 文字列の条件
    ```sql
    WHERE col_a LIKE '%@gmail.com';
    WHERE col_a LIKE 'QA_';
    ```

- ケースセンシティブな文字列の条件
    ```sql
    WHERE col_a LIKE BINARY '%@gmail.com';
    ```

- 文字列条件に％や_を含む条件
    ```sql
    -- 20250123_50% のような記述になっている行を抽出
    WHERE col_a LIKE BINARY CONCAT(date, '\_', percentage, '%\%');
    ```

- 複数の条件分岐
    ```sql
    WHERE 
        CASE 
            WHEN col_a = '+' THEN col_b + col_c
            WHEN col_a = '-' THEN col_b - col_c
        END;
    ```

## ソート
- 複数列でのソート
    ```sql
    ORDER BY col_a*col_b DESC, col_c ASC;
    ```

- ある列の要素の任意順序でソート
    ```sql
    FIELD(col_a, 'ele_a', 'ele_b', 'ele_c');
    ```

## 列方向の結合
- レフトジョイン
    ```sql
    SELECT * FROM table_1 LEFT JOIN table_2 ON table_1.col_a = table_2.col_b;
    ```

## 行方向の結合
- 重複削除して結合（処理速度が遅い）
    ```sql
    SELECT * FROM table_1 UNION SELECT * FROM table_2;
    ```

- 重複もそのまま結合（処理速度が速い）
    ```sql
    SELECT * FROM table_1 UNION ALL SELECT * FROM table_2;
    ```

## 欠損値の処理
- 欠損値の補完
    ```sql
    COALESCE(col_a, 'hoge');
    ```

## 文字列操作
- 先頭N文字取得
    ```sql
    LEFT(col_a, N);
    ```

- 文字の削除
    ```sql
    -- 基本的な空白削除
    SELECT TRIM('  Hello  ');    -- 結果: 'Hello'
    SELECT LTRIM('  Hello  ');   -- 結果: 'Hello  '
    SELECT RTRIM('  Hello  ');   -- 結果: '  Hello'

    -- 特定の文字を削除
    SELECT TRIM(BOTH 'x' FROM 'xxxHelloxxxx'); -- 結果: 'Hello'
    SELECT TRIM(LEADING 'x' FROM 'xxxHelloxxxx');   -- 結果: 'Helloxxxx'
    SELECT TRIM(TRAILING 'x' FROM 'xxxHelloxxxx');  -- 結果: 'xxxHello'
    ```

## 集約処理
- 合計値の計算
    ```sql
    SELECT country, SUM(GDP) AS total_GDP FROM table GROUP BY country ORDER BY SUM(GDP) DESC;
    ```

- 集約値を用いたフィルタリング
    ```sql
    SELECT country, SUM(GDP) AS total_GDP FROM table GROUP BY country HAVING SUM(GDP) > 10 ORDER BY SUM(GDP) DESC;
    ```

- アルファベット順で一番
    ```sql
    SELECT continent, MIN(name) FROM world group by continent;
    ```

- フィルタリング条件に使用
    ```sql
    -- すべての国の人口が 25,000,000 以下の大陸に属する国の取得
    SELECT name, continent, population
    FROM world
    WHERE continent IN (
        SELECT continent
        FROM world
        GROUP BY continent
        HAVING MAX(population) <= 25000000
    );
    ```

## テクニカルな操作
- ある列の全ての値の積
    ```sql
    SELECT EXP(SUM(LOG(col_a))) AS product
    FROM table
    WHERE col_a IS NOT NULL AND col_a > 0;
    ```

- 動的な条件設定
    ```sql
    -- WHERE 1=1 を使うことで動的に条件を追加しやすくなる（ANDを気にせず追加できる）
    SELECT * FROM users 
    WHERE 1=1
    AND name = 'Alice'
    AND age > 30;
    ```

## WITH句
- 複数回参照するテーブルの作成
    ```sql
    -- SQL Zoo Self Join 10
    WITH route AS (
        SELECT DISTINCT 
            a.company, 
            a.num, 
            a.stop AS from_stop, 
            stop_a.name AS from_name, 
            b.stop AS to_stop, 
            stop_b.name AS to_name
        FROM route a
        JOIN route b 
            ON a.company = b.company 
            AND a.num = b.num
        JOIN stops stop_a 
            ON a.stop = stop_a.id
        JOIN stops stop_b 
            ON b.stop = stop_b.id
    )

    SELECT 
        r1.num, 
        r1.company, 
        r1.to_name, 
        r2.num, 
        r2.company
    FROM route AS r1
    JOIN route AS r2 
        ON r1.to_name = r2.from_name
    WHERE 
        r1.from_name = 'Craiglockhart' 
        AND r2.to_name = 'Lochend'
    ORDER BY 
        r1.num, 
        r1.to_name, 
        r2.num;
    ```

## サブクエリ
- SELECT IN SELECT
    ```sql
    -- SQL Zoo Window functions 5
    SELECT constituency, party 
    FROM (
        SELECT 
            constituency, 
            party, 
            votes, 
            RANK() OVER (
                PARTITION BY constituency 
                ORDER BY votes DESC
            ) AS pos
        FROM ge
        WHERE 
            constituency BETWEEN 'S14000021' AND 'S14000026'
            AND yr = 2017
    ) AS rank
    WHERE rank.pos = 1
    ORDER BY constituency;
    ```

## Window関数
- a
    ```sql

    ```

## 
- a
    ```sql

    ```
