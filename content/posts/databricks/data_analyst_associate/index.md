+++
title = 'Databricks Certified Data Analyst Associate 試験勉強まとめ'
subtitle = ""
date = 2025-03-02
lastmod = 2025-03-02
draft = false
KaTex = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["Databricks", "試験"]
categories = ["Databricks"]
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
# 試験勉強に使用した教材
## 公式
- [Databricks Certified Data Analyst Associate Guide](https://www.databricks.com/sites/default/files/2024-10/databricks-certified-data-analyst-associate-guide.pdf)
- [Data Analyst Learning Plan](https://partner-academy.databricks.com/learn/learning-plans/78/data-analyst-learning-plan)

## その他
- [Databricks Certified Data Analyst Associate: Practice Exams](https://www.udemy.com/course/databricks-certified-data-analyst-associate-practice-exams-j)
- [Databricks Certified Data Analyst Associate Exam](https://www.itexams.com/info/Certified-Data-Analyst-Associate)

# 試験結果
- Databricks SQL : 90 %
- Data Management : 100 %
- SQL : 100 %
- Data Visualization and Dashboard : 75 %
- Analytics Applications : 60 %

# まとめ
## 試験対策
| 質問                   | 回答    |
| -------------------- | --------------- |
| Databricks SQLでクエリの実行に使用されるDatabricksの機能はどれ？ | SQL Editor (QueriesはSQLクエリを保存する機能) |
| レイクハウスのメダリオンアーキテクチャの説明として正しいもの | 一つのアップストリームテーブルは、複数のダウンストリームテーブルの生成に利用される |
| SQL Warehouseのサイジングとスケーリングに関する記述として正しいものを2つ選択 | １．最大スケーリングを増やすことは、複数ユーザが同時に同じWarehouseを使用することを助ける。２．スケーリングはデフォルトで最小値1・最大値1に設定されている |
| DatabricksとFivetranを接続し、データ取り込みを行うアプローチを選択 | パートナーコネクトを使用して、SQL WarehouseにFivetranを接続 |
| Databricks SQL時にData Explorerにより提供される利点は何？ | メタデータやデータを確認でき、権限の確認や変更も可能 |
| テンポラリービューはクラスターが終了するとどうなる？ | 削除され、参照できなくなる |
| テーブルの削除コマンド | `DROP TABLE db_name.table_name` |
| LEFT SEMI JOINとLEFT ANTI JOINの結果はそれぞれどうなる？ | LEFT SEMI JOINは、左テーブルのうち右テーブルに一致する行のみ返し、LEFT ANTI JOINは、左テーブルのうち右テーブルに一致しない行のみ返す |
| 全組み合わせの集約を行うコマンド | `GROUP BY CUBE` |
| 統計学の文脈で、統計分布の重要なモーメントとは何？ | 平均（第1モーメント）、分散（第2モーメント）、歪度（第3モーメント）、尖度（第4モーメント） |
| テーブル名を変更するコマンド | `ALTER TABLE RENAME TO` |
| ROLLUPコマンドとCUBEコマンドの違い | １．ROLLUPは階層的な集計結果を生成し、CUBEは全ての組み合わせに対する集計結果を生成。２． ROLLUPは指定された列の順序によって結果が変わるが、CUBEは順序に依存しない |
| Data Enhancementとは？ | 外部データソースを取り入れることで、既存のデータセットを充実させること |
| Databricks SQLを使用してAmazon S3バケットからDatabricks環境にデータをインポートするSQLコマンドは？ | `COPY INTO my_table FROM 's3://mybucket/mydata.csv' FILEFORMAT = CSV;` (COPY INTOコマンドは増分および一括データロードによく使用される) |
| ANALYZE TABLEコマンドを使用する主な目的は？ | テーブルに関する重要な統計情報を収集するため (これらの統計は、行数やバイト単位のサイズなどの詳細を含み、クエリ・オプティマイザが効率的なクエリ・プランを作成する上で重要) |
| Databricks SQLダッシュボードを共有する場合、'Run as viewer' と 'Run as owner' の2つの主要な設定があります。ダッシュボードを共有する際の各設定の長所と短所は？ | 'Run as viewer'は、個々のビューワの権限に従うことで、データのセキュリティを強化する（長所）が、データの可視性を制限する可能性がある（短所） 'Run as owner'は、ユーザー間で一貫したデータの可視性を保証する（長所）が、所有者がより広範なデータアクセス権を持っている場合、セキュリティリスクを引き起こす可能性がある（短所） |
| Databricksの文脈では、データのプライバシーとコンプライアンスを確保するために、個人を特定できる情報（PII）は通常どのように扱われる？ | デルタレイクによるきめ細かなアクセス・コントロール |
| MERGE INTO、INSERT INTO、COPY INTOコマンドの使い分けは？ | MERGE INTOは既存レコードの更新と新規レコードの挿入に適しており、INSERT INTOは新規レコードの追加のみに使用され、COPY INTOはファイルなどの外部ソースからテーブルにデータをロードするために使用される |
| クエリ結果がキャッシュから返されているかを確認する方法 | クエリ履歴から該当の確認したいクエリを選択し、クエリの詳細中に「キャッシュ」と記載があるかを確認 (キャッシュから返された場合、クエリプロファイルも表示されない) |
| DatabricksでANSI SQLに準拠する利点 | 移植性の向上 |
| Alerts で使用しているクエリ内にパラメータがある場合、パラメータの扱いはどうなる？ | SQLエディタで指定されているデフォルト値が使用される (デフォルト値が指定されていないとエラーになる) |

## 知識
### ビューの分類
| Viewの種類    | 永続性  | 参照できる範囲 | 物理エンティティ | 更新  | 主な用途  |
| -------| ----| --------------| -------- | -------- | ------|
| **Temporary View**    | セッション内のみ   | 同じクラスターのセッション内 | × (実行時にクエリを評価) |自動更新 | 一時的なデータ処理   |
| **Global Temporary View** | クラスターが動作中のみ | クラスター内のすべてのセッション | × (実行時にクエリを評価) |自動更新 | クラスター内の共有データ |
| **Permanent View**| 永続   | ワークスペース全体   | × (実行時にクエリを評価) |自動更新 | データの整理・共有   |
| **Materialized View** | 永続   | ワークスペース全体   | ○ |手動更新 | 高速クエリ・BIツール |

### `CUBE` コマンド
- クエリ
  ```sql
  SELECT Year, Product, SUM(Sales) as TotalSales
  FROM Sales
  GROUP BY CUBE (Year, Product)
  ORDER BY Year, Product;
  ```

- Sales テーブル
  | Year | Product  | TotalSales |
  |------|----------|------------|
  | 2021 | ProductA | 100        |
  | 2021 | ProductB | 150        |
  | 2022 | ProductA | 200        |
  | 2022 | ProductB | 250        |

- クエリ結果
  | Year | Product  | TotalSales |
  |------|----------|------------|
  | 2021 | ProductA | 100        |
  | 2021 | ProductB | 150        |
  | 2021 | NULL     | 250        |
  | 2022 | ProductA | 200        |
  | 2022 | ProductB | 250        |
  | 2022 | NULL     | 450        |
  | NULL | ProductA | 300        |
  | NULL | ProductB | 400        |
  | NULL | NULL     | 700        |

### `ROLLUP` コマンド
- クエリ
  ```sql
  SELECT 地域, 都道府県, 市区町村, SUM(売上) AS 売上合計
  FROM 売上データ
  GROUP BY ROLLUP(地域, 都道府県, 市区町村)
  ```

- 売上データテーブル
  | 地域 | 都道府県 | 市区町村 | 売上 |
  | ---- | -------- | -------- | ---- |
  | 関東 | 東京都   | 新宿区   | 100  |
  | 関東 | 東京都   | 渋谷区   | 200  |
  | 関西 | 大阪府   | 大阪市   | 150  |
  | 関西 | 京都府   | 京都市   | 120  |

- クエリ結果
  | 地域 | 都道府県 | 市区町村 | 売上合計 |
  | ---- | -------- | -------- | -------- |
  | 関東 | 東京都   | 新宿区   | 100      |
  | 関東 | 東京都   | 渋谷区   | 200      |
  | 関東 | 東京都   | NULL     | 300      |
  | 関東 | NULL     | NULL     | 300      |
  | 関西 | 大阪府   | 大阪市   | 150      |
  | 関西 | 京都府   | 京都市   | 120      |
  | 関西 | 京都府   | NULL     | 270      |
  | 関西 | NULL     | NULL     | 270      |
  | NULL | NULL     | NULL     | 570      |

### `INSERT INTO` コマンド
> - テーブルに新しい行を挿入するために使用
> - 既存の行を変更したり、既存の行に基づいて何かをしたりすることはできない
> - 単純なデータの追加に最適

- クエリ
  ```sql
  INSERT INTO customers (customer_id, name, city) VALUES (3, 'David', 'Kyoto');
  ```

- customers テーブル
  | customer_id | name | city  |
  | ----------- | ---- | ----- |
  | 1           | John | Tokyo |
  | 2           | Jane | Osaka |

- クエリ結果
  | customer_id | name  | city  |
  | ----------- | ----- | ----- |
  | 1           | John  | Tokyo |
  | 2           | Jane  | Osaka |
  | 3           | David | Kyoto |

### `MERGE INTO` コマンド
> - ソーステーブルの行に基づいて、ターゲットテーブルの行を更新・挿入・削除するために使用
> - 既存のデータを変更したり、新しいデータを挿入したり、不要なデータを削除したりと、より複雑なデータ操作が可能
> - データの同期や、変更の追跡に最適

- クエリ
  ```sql
  MERGE INTO customers
  USING new_customers
  ON customers.customer_id = new_customers.customer_id
  WHEN MATCHED THEN
    UPDATE SET
      customers.name = new_customers.name,
      customers.city = new_customers.city
  WHEN NOT MATCHED THEN
    INSERT (customer_id, name, city) VALUES (new_customers.customer_id, new_customers.name, new_customers.city);  
  ```

- customers テーブル
  | customer_id | name  | city  |
  | ----------- | ----- | ----- |
  | 1           | John  | Tokyo |
  | 2           | Jane  | Osaka |
  | 3           | David | Kyoto |

- new_customers テーブル
  | customer_id | name  | city    |
  | ----------- | ----- | ------- |
  | 2           | Janet | Fukuoka |
  | 4           | Susan | Nagoya  |

- クエリ結果
  | customer_id | name  | city    |
  | ----------- | ----- | ------- |
  | 1           | John  | Tokyo   |
  | 2           | Janet | Fukuoka |
  | 3           | David | Kyoto   |
  | 4           | Susan | Nagoya  |
