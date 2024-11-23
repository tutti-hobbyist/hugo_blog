+++
title = 'Apache Spark徹底入門'
subtitle = ""
date = 2024-11-12
lastmod = 2024-11-23
draft = false
KaTex = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["Databricks", "Apache Spark"]
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
## 関連リンク
- [Apache Spark徹底入門](https://www.shoeisha.co.jp/book/detail/9784798186788)
- [GitHub](https://github.com/databricks/LearningSparkV2)

## 動作検証バージョン（2024/11時点）
- Python : 3.11 (3.13では実施していたところ、以下のエラーが発生)
  - エラー解決時に参照：https://stackoverflow.com/questions/77369508/python-worker-keeps-on-crashing-in-pyspark
- JDK : 21.0
- Apache Spark : 3.5

## 1章
### Apache Sparkとは
- 中間計算のためのインメモリストレージを提供
  - 中間結果をすべてメモリに保持しつつ、ディスクI/Oの発生を抑制
- Hadoop Map Reduce よりもはるかに高速な処理が可能
- クエリ計算をDAG（有向非循環グラフ）として構築
### Sparkのコンポーネント
![Sparkのコンポーネント](spark_component.png "Sparkのコンポーネント")
- Driver
  - SparkSessionのインスタンス化
  - ClusterManagerとの通信
  - ClusterManagerへのSparkExecutor（JVM）のリソースのリクエスト
  - SparkプロセスのDAG計算処理への変換
  - 処理のスケジューリング
  - TaskをSparkExecutorに分散
  - リソース割り当て後は、ClusterManagerを介さず直接SparkExecutorと通信
- SparkSession
  - Sparkのすべての機能への統合された単一のエントリーポイント
  - 以前は、SparkContext, SQLContext, StreamingContext などコンテキストを個別に作成する必要があった
- ClusterManager
  - クラスターノードの管理とリソースの割り当て
  - 現在は以下4つのクラスターマネージャーをサポート
    - ビルトインのスタンドアロンクラスターマネージャー
    - Apache Hadoop YARN
    - Apache Mesos
    - Kubernetes
- SparkExecutor
  - ワーカーノード上でタスクを実行
### Deployment Mode
![Deployment Mode](deployment_mode.png "Deployment Mode")

## 2章
### Sparkアプリケーションのコンセプト
- Application
  - SparkのAPIを利用して、Spark上に構築されるユーザープログラム
- SparkSession
  - Sparkの関数と対話するためのオブジェクト
- Job
  - Sparkのアクション（eg: save(), collect()に応じて生成される複数のタスクから構成される並列計算処理
- Stage
  - 各Jobは互いに依存するStageと呼ばれる小さなタスクの集合に分割される
- Task
  - SparkのExecutorに送られる単一の実行単位
![Sparkアプリケーションのコンセプト](spark_app_concept.png " ")
### Sparkの操作
- 分散データに対するSparkの操作は、トランスフォーメーションとアクションの2種類
  - トランスフォーメーション
    - 遅延評価されるため、変換処理は即座に計算されるわけではなく、リネージとして記録
    - リネージの記録を利用して、協調処理や処理の最適化を実現
    - ナロートランスフォーメーション（単一のパーティションで処理が完結）とワイドトランスフォーメーション（複数のパーティションを考慮した処理が必要）の２種類
    - 例：orderBy(), groupBy(), filter(), select(), join()
  - アクション
    - 記録されたトランスフォーメーションの評価を開始するトリガー
    - 例：show(), take(), count(), collect(), save()

## 3章
- コードを動かすために、winutils.exeをbinディレクトリに保存し、PYSPARK_PYTHONを環境変数に追加する必要あり
  - 参照：https://stackoverflow.com/questions/53252181/python-worker-failed-to-connect-back
  - winutils：https://github.com/cdarlint/winutils
### RDDとDSLオペレータ
- RDD
  - ローレベル
  - Sparkは関数内の計算または式を検査できないため、最適化も不可
  ```Python
  data_RDD = sc.parallelize([("A", 20), ("B", 30), ("C", 20), ("A", 30), ("A", 40), ("B", 20)])
  ave_RDD = (data_RDD
    .map(lambda x: (x[0], (x[1], 1)))
    .reduceByKey(lambda x, y: (x[0] + y[0], x[1] + y[1]))
    .map(lambda x: (x[0], x[1][0]/x[1][1]))
  )
  ```
- DSLオペレータ
  - ハイレベル
  - Sparkはクエリを検査または解析して意図を理解できるため、操作の最適化やアレンジが可能
  ```Python
  data_df = spark.createDataFrame([("A", 20), ("B", 30), ("C", 20), ("A", 30), ("A", 40), ("B", 20)], ["group", "value"])
  ave_df = data_df.groupBy("group").agg(avg("value"))
  ```
### データ型
- SparkにおけるPythonの基本的なデータ型
  ![SparkにおけるPythonの基本的なデータ型](python_basic_data_type.png "SparkにおけるPythonの基本的なデータ型")
- SparkにおけるPythonの構造化データ型
  ![SparkにおけるPythonの構造化データ型](python_structured_data_type.png "SparkにおけるPythonの構造化データ型")
- SparkにおけるScalaの基本的なデータ型
  ![SparkにおけるScalaの基本的なデータ型](scala_basic_data_type.png "SparkにおけるScalaの基本的なデータ型")
- SparkにおけるScalaの構造化データ型
  ![SparkにおけるScalaの構造化データ型](scala_structured_data_type.png "SparkにおけるScalaの構造化データ型")
### スキーマの作成
- スキーマは外部データソースからデータを読み取る際に必要
- **事前にスキーマを定義**することは、スキーマ・オン・リード・アプローチよりも以下の利点がある
  - Sparkがデータ型を推論する負担を軽減できる
  - Sparkが別のジョブを作成して、大量のファイルを読み取ってスキーマを確認する必要がなくなる
  - スキーマにデータが一致しない場合、エラーを早期検知できる
- スキーマの定義方法は2つ
  - Sparkのデータ型
  - DDL
  ```Python
  from pyspark.sql import SparkSession

  # 1. Sparkのデータ型
  from pyspark.sql.types import *
  schema = StructType([
      StructField("group", StringType(), nullable=False), 
      StructField("value", IntegerType(), nullable=False)
      ])
  # 2. DDL
  schema = "group STRING, value INT"

  spark = SparkSession.builder.getOrCreate()
  # データを定義して読み込む
  data = [("A", 20), ("B", 30), ("C", 20), ("A", 30), ("A", 40), ("B", 20)]
  data_df = spark.createDataFrame(data, schema)
  # jsonファイルからデータを読み込む
  # json_path = ~~~
  # data_df = spark.read.schema(schema).option("multiline", "true").option("charset", "UTF-8").json("{json_path}")
  
  data_df.show()
  print(data_df.schema) # スキーマ定義の表示
  print(data_df.printSchema()) #スキーマ定義の見やすい表示
  ```
### DataFrameの操作
> - 参照
>   - [pyspark.sql.DataFrameの公式ドキュメント](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql/api/pyspark.sql.DataFrame.html)
>   - [Pyspark Vs Pandas Cheatsheet](https://www.scribd.com/document/423024301/pyspark-vs-pandas-cheatsheet)
> - DataFrameは実際にはScalaのDataset[Row]
> - 頻繁または繰り返しクエリを実行する予定の大規模なDataFrameの場合、Cacheを利用するとよい
>    - DataFrame.cache()
- 列名の取得  
  ```python
  DataFrame.columns
  ```
- 列名の変更
  ```python
  renamed_DataFrame = DataFrame.withColumnRenamed("{col_name_before}", "{col_name_after}")
  ```
- 列に対する計算
  ```python
  from pyspark.sql.functions import col
  new_DataFrame = DataFrame.select(col("{column_name}")*2)
  ```
- 列に対する計算を元のデータフレームの新規列として定義
  ```python
  from pyspark.sql.functions import expr
  new_col_DataFrame = DataFrame.withColumn("{new_column_name}", (expr("{column_name} {condition}"))) # expr()内部はSQLも記述可能
  ```
- 列に対するソート
  ```python
  from pyspark.sql.functions import col
  sorted_DataFrame = DataFrame.sort(col("{column_name}").desc())
  ```
- 行の作成と要素の取り出し
  ```python
  from pyspark.sql import Row
  one_row = Row("A", 10)
  group, value = one_row[0], one_row[1]
  print(group, value)
  for el in one_row:
    print(el)
  ```
- ある列のユニークな行要素の抽出
  ```python
  (DataFrame
    .select("{column_name}")
    .where(col("{column_name}").isNotNull())
    .distinct()
    .show())
  ```
- 列の削除
  ```python
  DataFrame.drop("{column_name}")
  ```
- 行を用いたDataFrameの作成
  ```python
  from pyspark.sql import Row
  one_row = Row("A", 10)
  another_row = Row("B", 20)
  rows = [one_row, another_row]
  df = spark.createDataFrame(rows, ["group", "value"])
  df.show()
  ```
- データの読み込み
  - sf_fire_calls.csv で確認
  - スキーマの有無による読み込み速度の違い
    - スキーマ指定あり：0.03秒
    - スキーマ指定なし：2.3秒
  ```python
  import os
  import time
  from pyspark.sql import SparkSession
  from pyspark.sql.types import *

  spark = SparkSession.builder.getOrCreate()
  par_dir = os.path.dirname(os.path.abspath(__file__))

  # 1. schemaを指定しない場合
  start = time.time()
  fire_df_without_schema = spark.read.csv(f"{par_dir}/data/sf-fire-calls.csv", header=True) # csvから読み込む場合
  # fire_df_without_schema = spark.read.format("parquet").load(f"{par_dir}/data/sf-fire-calls_parquet") # parquetから読み込む場合
  elapse = time.time() - start
  print(elapse)

  # 2. schemaを指定する場合
  fire_schema = StructType([StructField('CallNumber', IntegerType(), True),
                       StructField('UnitID', StringType(), True),
                       StructField('IncidentNumber', IntegerType(), True),
                       StructField('CallType', StringType(), True),                  
                       StructField('CallDate', StringType(), True),      
                       StructField('WatchDate', StringType(), True),
                       StructField('CallFinalDisposition', StringType(), True),
                       StructField('AvailableDtTm', StringType(), True),
                       StructField('Address', StringType(), True),       
                       StructField('City', StringType(), True),       
                       StructField('Zipcode', IntegerType(), True),       
                       StructField('Battalion', StringType(), True),                 
                       StructField('StationArea', StringType(), True),       
                       StructField('Box', StringType(), True),       
                       StructField('OriginalPriority', StringType(), True),       
                       StructField('Priority', StringType(), True),       
                       StructField('FinalPriority', IntegerType(), True),       
                       StructField('ALSUnit', BooleanType(), True),       
                       StructField('CallTypeGroup', StringType(), True),
                       StructField('NumAlarms', IntegerType(), True),
                       StructField('UnitType', StringType(), True),
                       StructField('UnitSequenceInCallDispatch', IntegerType(), True),
                       StructField('FirePreventionDistrict', StringType(), True),
                       StructField('SupervisorDistrict', StringType(), True),
                       StructField('Neighborhood', StringType(), True),
                       StructField('Location', StringType(), True),
                       StructField('RowID', StringType(), True),
                       StructField('Delay', FloatType(), True)])
  start = time.time()
  fire_df_without_schema = spark.read.csv(f"{par_dir}/data/sf-fire-calls.csv", header=True, schema=fire_schema)
  elapse = time.time() - start
  print(elapse)
  ```
- データの書き込み
  > DataFrameをParquetとして書き込む場合、スキーマはParquetメタデータの一部として保存されるため、以降の読み取りでスキーマを指定する必要がなくなる
  ```python
  fire_df_with_schema.write.format("parquet").mode("overwrite").save(f"{parquet_save_path}")
  # fire_df_with_schema.write.format("parquet").saveAsTable(f"{table_name}") # DataFrameをテーブルとして保存する場合
  ```
- 文字列から日付への変換
  ```python
  new_df = df
            .withColumn("{datetime_col_name}", to_timestamp(col("{str_datetime_col_name}"), "MM/dd/yyyy hh:mm:ss a"))
            .drop("{str_datetime_col_name}")
  ```
- 統計値の確認
  > Pysparkの関数がPythonの組み込み関数と競合しないように、PysparkのモジュールをFとしてインポート
  ```python
  import pyspark.sql.functions as F
  df.select(F.sum("{col_1}"), F.avg("{col_2}"), F.min("{col_3}"), F.max("{col_4}")).show()
  ```
  - 上記以外の統計値を確認するための関数の例
    - stat()
    - describe()
    - correlation()
    - covariance()
    - sampleBy()
    - approxQuantile()
    - frequentItems()
- グループ化
  > agg()（集約関数）を使うと、集約後の列名にエイリアスを指定できるので、列名を自分で定義したいときは便利
  ```python
  # 1. count() + orderBy()
  DataFrame.select("{column_name}").where(col("{column_name}").isNotNull()).groupBy("{column_name}").count().orderBy("count", ascending=False).show()
  # 2. agg() + sort()
  DataFrame.select("{column_name}").where(col("{column_name}").isNotNull()).groupBy("{column_name}").agg(count("{column_name}").alias("{new_column_name}")).sort(col("{new_column_name}").desc()).show()
  ```
- 行方向に結合 (Union)
  ```python
  new_DF = DataFrame.union(another_DataFrame)
  ```
- 列方向に結合 (Join)
  ```python
  new_DF = DataFrame.join(another_DataFrame, DataFrame.{column_name}=another_DataFrame.{column_name})
  ```
- PandasとPySparkの対応
  | **機能**           | **Pandas**      | **PySpark**      |
  |----------------|--------------|-------------------------|
  | **ライブラリのインポートと設定** | `import pandas as pd`<br>`pd.options.display.max_colwidth = 1000` | `from pyspark.sql.types import *`<br>`from pyspark.sql.functions import *`<br>`from pyspark.sql import SQLContext` |
  | **データセットの作成**    | `data = {'col1': [ ], 'col2': [ ]}`<br>`df = pd.DataFrame(data, columns=['col1', 'col2'])` | `StructField('Col1', IntegerType())`<br>`StructField('Col2', StringType())`<br>`schema = StructType([list of StructFields])`<br>`df = SQLContext(sc).createDataFrame(sc.emptyRDD(), schema)` |
  | **CSVの読み込みと書き込み**   | `df.read_csv()`<br>`df.to_csv()`   | `SQLContext(sc).read.csv()`<br>`df.toPandas().to_csv()`    |
  | **インデックスと分割**    | `df.loc[]`<br>`df.iloc[]`     | `df.randomSplit(weights=[ ], seed=n)`     |
  | **データの確認**   | `df.head()`<br>`df.columns`<br>`df.shape`    | `df.show()`<br>`df.head(n)`<br>`df.printSchema()`<br>`df.columns`<br>`df.count()` |
  | **重複データの処理**      | `df.unique()`<br>`df.duplicated()`<br>`df.drop_duplicates()` | `df.distinct().count()`<br>`df.dropDuplicates()`   |
  | **列名の変更**  | `df.rename(columns={"oldcol":"new-col"})`      | `df.withColumnRenamed("oldcol","new-col")`    |
  | **欠損データの処理**      | `df.dropna()`<br>`df.fillna()`<br>`df.replace()`<br>`df['col'].isna()`<br>`df['col'].isnull()`<br>`df['col'].notna()`<br>`df['col'].notnull()` | `df.na.drop()`<br>`df.na.fill()`<br>`df.na.replace()`<br>`df.col.isNull()`<br>`df.col.isNotNull()` |
  | **一般的な列の操作**      | `df['col'] = df['col'].str.lower()`<br>`df['col'] = df['col'].str.replace()`<br>`df['col'] = df['col'].str.split()`<br>`df['col'] = df['col'].str.join()`<br>`df['col'] = df['col'].str.strip()` | `df = df.withColumn('col', lower(df.col))`<br>`df = df.select('*',regexp_replace().alias())`<br>`df = df.withColumn('col', split('col'))`<br>`df = df.withColumn('col', udf.join(df.col, lit(' ')))`<br>`df = df.withColumn('col', trim(df.col))` |
  | **ユーザー定義関数の適用**   | `df['col'] = df['col'].map(UDF)`<br>`df.apply(f)`<br>`df.applyMap(f)` | `df = df.withColumn('col', UDF(df.col))`<br>`df = df.withColumn('col', when(cond, UDF(df.col)).otherwise())` |
  | **2つの列の結合**       | `df['new_col'] = df['col1'] + df['col2']`   | `df = df.withColumn('new_col', concat_ws(',',df.col1,df.col2))`<br>`df.select('*',concat(df.col1,df.col2).alias('new_col'))` |
  | **列をリストに変換**     | `list(df['col'])`    | `df.select("col").rdd.flatMap(lambda x:x).collect()`      |
  | **データのフィルタリング**   | `df = df[df['col'] != ""]`       | `df = df[df['col'] == val]`<br>`df = df.filter(df['col'] == val)`   |
  | **列の選択**       | `df = df[['col1','col2','col3']]`      | `df = df.select('col1','col2','col3')`  |
  | **列の削除**       | `df.drop(['B','C'], axis=1)`<br>`df.drop(columns=['B', 'C'])` | `df.drop('col1','col2')`    |
  | **データのグループ化**   | `df.groupby(by=['col1','col2']).count()`     | `df.groupBy('col').count().show()`      |
  | **データの結合**   | `pd.concat([df1,df2])`<br>`df1.append(df2)`<br>`df1.join(df2)` | `df1.union(df2)`<br>`df1.join(df2)`     |
  | **直積**    | `df1['key'] = 1`<br>`df2['key'] = 1`<br>`df1.merge(df2, how='outer', on='key')` | `df1.crossJoin(df2)`  |
  | **データのソート**       | `df.sort_values()`<br>`df.sort_index()`      | `df.sort()`<br>`df.orderBy()`     |
### SparkSQL
![Spark SQL architecture and interface](spark_sql_architecture.png "Spark SQL architecture and interface")
- SparkSQLのCatalystOptimizerは、計算クエリを受け取り、実行計画に変換する
  ```python
  # 実行計画の確認
  DataFrame.explain(True)
  ```
- クエリ最適化の4つのフェーズ
  - 分析：SQLまたはDataFrameクエリの抽象構文木（AST）を生成
  - 論理的最適化：コストベース最適化
  - 物理的最適化：論理計画に適した物理計画を生成
  - コード生成：効率的なJavaバイトコードを生成

## 4章
### TempViewの作成とクエリの実行
> - カラム名にスペースを含む場合、SQLで列名を指定する際に`（バッククォート）で囲む
> - Global Temporary Viewにクエリする際は、`global_temp.{view_name}` で参照
```python
import os
from pyspark.sql import SparkSession
from pyspark.sql.types import *
from pyspark.sql.functions import *

spark = SparkSession.builder.getOrCreate()
par_dir = os.path.dirname(os.path.abspath(__file__))
filename = "Electric_Vehicle_Population_Data.csv" # https://catalog.data.gov/dataset/electric-vehicle-population-data
data_path = f"{par_dir}/data/{filename}"

df = spark.read.format("csv").option("infer_schema", "true").option("header", "true").load(data_path)
df.show(5, False)
print(df.columns)

# TempViewの作成
view_name = "ev_data_temp_view"
df.createOrReplaceTempView(f"{view_name}")

# TempViewに対するクエリ
df_sql = spark.sql(f"SELECT County, State, Model Year, Make, Model, `Electric Vehicle Type`, `Vehicle Location` FROM {view_name}")
df_sql.show(5, False)

# 一致していることを確認
df = df.select('County', 'State', 'Model Year', 'Make', 'Model', 'Electric Vehicle Type', 'Vehicle Location')
df.show(5, False)
```
### メタデータの確認
- Sparkはマネージドテーブル、アンマネージドテーブルに関連するメタデータを管理
- メタデータはCatalogにキャプチャされる
```python
print(spark.catalog.listTables())
print(spark.catalog.listColumns(f"{table_name/view_name}"))
```
### 画像データの読み込み
```python
import os
import cv2
import numpy as np
from PIL import Image
from pyspark.sql import SparkSession
from pyspark.sql.types import *
from pyspark.sql.functions import *

spark = SparkSession.builder.getOrCreate()
par_dir = os.path.dirname(os.path.abspath(__file__))
data_path = f"{par_dir}/images/*"

df_image = spark.read.format("image").load(data_path)
df_binary =  spark.read.format("binaryFile").option("recursiveFileLookup", "false").option("pathGlobFilter", "*.jpg").load(data_path)
print(f"{df_image.printSchema()=}, {df_binary.printSchema()=}")

def show_image(image_row):
    # Sparkの構造から画像データを抽出
    image_data = image_row["image"].asDict()
    height = image_data["height"]
    width = image_data["width"]
    nChannels = image_data["nChannels"]
    data = image_data["data"]

    # データをnumpy配列に変換
    np_image = np.array(data).reshape((height, width, nChannels))

    # 1. cv2で表示
    cv2.imshow("Loaded Image", np_image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # 2. PILで表示
    # pil_image = Image.fromarray(np_image)
    # pil_image.show()

# バイナリデータを扱うためのshow_image関数
def show_binary(image_row):
    # 画像のバイナリデータを取得
    binary_data = image_row["content"]

    # バイナリデータをnumpy配列として読み込む
    image = Image.open(io.BytesIO(binary_data))
    np_image = np.array(image)

    # 1. cv2で表示
    cv2.imshow("Loaded Image", np_image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # 2. PILで表示
    # image.show()

image_row = df_image.select("image").limit(df_image.count()).collect()
for image in image_row:
    show_image(image)

binary_row = df_binary.select("content").limit(df_binary.count()).collect()
for content in binary_row:
    show_binary(content)
```

## 5章
### ユーザー定義関数 (UDF)
- UDFはセッションごとに動作し、メタストアに永続化されない
```python
from pyspark.sql import SparkSession
from pyspark.sql.types import *
from pyspark.sql.functions import *

def cubed(n):
    return n**3

spark = SparkSession.builder.getOrCreate()
spark.udf.register("cubed", cubed, LongType()) # UDFの登録
spark.range(1, 5).createOrReplaceTempView("udf_test") # TempViewの作成
spark.sql("SELECT id, cubed(id) AS id_cubed FROM udf_test").show() # TempViewにUDFを用いたクエリを投げる
```
### Pandas UDFによるPySpark UDFの高速化と分散化
- PySpark UDFはJVMとPython間でのデータ移動が必要であり高コスト
- Pandas UDFはApache Arrowを使用し、データのシリアライズを不要にすることで高速化を実現
```python
import time
from pyspark.sql import SparkSession
from pyspark.sql.types import *
from pyspark.sql.functions import *

spark = SparkSession.builder.getOrCreate()
df = spark.range(1, 10001)

# 純粋なPySpark UDF
def squared(n):
    return n**2

spark.udf.register("squared", squared, LongType()) # UDFの登録

pyspark_udf_elapse_list = []
for iter in range(6):
    pyspark_udf_start = time.time()
    for _ in range(100):
        df.select("id", squared(col("id")))
    pyspark_udf_elapse = time.time() - pyspark_udf_start
    pyspark_udf_elapse_list.append(pyspark_udf_elapse)
print(f"{pyspark_udf_elapse_list = }", np.mean(pyspark_udf_elapse_list))
"""
5回平均処理時間：0.3707027832667033
"""

# Pandas UDFを用いたPySpark UDF
def squared_pd(n:pd.Series) -> pd.Series:
    return n**2

squared_pandas = pandas_udf(squared_pd, returnType=LongType()) # Pandas UDFを定義

pandas_udf_elapse_list = []
for iter in range(6):
    pandas_udf_start = time.time()
    for _ in range(100):
        df.select("id", squared_pandas(col("id")))
    pandas_udf_elapse = time.time() - pandas_udf_start
    pandas_udf_elapse_list.append(pandas_udf_elapse)
print(f"{pandas_udf_elapse_list = }", np.mean(pandas_udf_elapse_list))
"""
5回平均処理時間：0.30323171615600586
"""
```
### ネスト構造のデータ処理
- 複雑なデータ型をそうさするためには、2つの解決策がある
  - ネスト構造を個々の行に展開して、処理を実装（ExplodeとCollect）
    - explode：ネスト構造を個々の行に展開
      ```python
      from pyspark.sql import SparkSession
      from pyspark.sql.types import *

      # 配列型データセットの作成
      arrayData = [[1, (1, 2, 3)], [2, (2, 3, 4)], [3, (3, 4, 5)]]

      spark = SparkSession.builder.getOrCreate()
      # スキーマの作成
      arraySchema = (StructType([
            StructField("id", IntegerType(), True), 
            StructField("values", ArrayType(IntegerType()), True)
            ]))

      # データフレームの作成
      df = spark.createDataFrame(spark.sparkContext.parallelize(arrayData), arraySchema)
      df.createOrReplaceTempView("tmp_vw")
      df.printSchema()
      df.show()

      spark.sql("""
      SELECT id, explode(values) as values FROM tmp_vw
      """).show()

      """
      +---+------+
      | id|values|
      +---+------+
      |  1|     1|
      |  1|     2|
      |  1|     3|
      |  2|     2|
      |  2|     3|
      |  2|     4|
      |  3|     3|
      |  3|     4|
      |  3|     5|
      +---+------+
      """
      ```
    - collect：各グループ内の要素を集計
      ```python
      spark.sql("""
      SELECT id, collect_list(value + 1) AS newValues
        FROM (SELECT id, explode(values) AS value FROM tmp_vw)
        GROUP BY id
      """).show()

      """
      +---+---------+
      | id|newValues|
      +---+---------+
      |  1|[2, 3, 4]|
      |  2|[3, 4, 5]|
      |  3|[4, 5, 6]|
      +---+---------+
      """
      ```
  - UDF：各要素に対して、任意の関数を適用
    ```
    def addOne(values):
      return [value + 1 for value in values]

    spark.udf.register("plusOne", addOne, ArrayType(IntegerType()))  
    spark.sql("SELECT id, plusOne(values) AS newValues FROM tmp_vw").show()
    ```

### データ操作の一覧
- [配列型関数](https://docs.databricks.com/en/sql/language-manual/sql-ref-functions-builtin.html#array-functions)
- [マップ型関数](https://docs.databricks.com/en/sql/language-manual/sql-ref-functions-builtin.html#map-functions)
- [配列型関数とマップ関数のサンプルノートブック](https://docs.databricks.com/ja/semi-structured/higher-order-functions.html#apache-spark-built-in-functions-notebook)
- [組み込み関数一覧](https://docs.databricks.com/en/sql/language-manual/sql-ref-functions-builtin.html#built-in-functions)

### 高階関数
- 使用データ
```python
from pyspark.sql.types import *
schema = StructType([StructField("celsius", ArrayType(IntegerType()))])

t_list = [[35, 36, 32, 30, 40, 42, 38]], [[31, 32, 34, 55, 56]]
t_c = spark.createDataFrame(t_list, schema)
t_c.createOrReplaceTempView("tC")
t_c.show()

"""
+--------------------+
|             celsius|
+--------------------+
|[35, 36, 32, 30, ...|
|[31, 32, 34, 55, 56]|
+--------------------+
"""
```
- Transform：入力配列の各要素に関数を適用して配列を生成
  ```python
  spark.sql("SELECT celsius, transform(celsius, t -> ((t * 9) div 5) + 32) as fahrenheit FROM tC").show()
  ```
- Filter：条件に合致する配列を生成
  ```python
  spark.sql("SELECT celsius, filter(celsius, t -> t > 38) as high FROM tC").show()
  ```
- Exists：指定した値の有無のブール値を生成
  ```python
  spark.sql("SELECT celsius, exists(celsius, t -> t = 38) as threshold FROM tC
  ").show()
  ```
- Reduce (Aggregate)：指定した初期値に対して、配列の要素をアキュムレータに逐次結合（累算）していき、配列の要素を一つずつ減らしていき、最後に得られた単一の値に対する最終関数を適用して結果を返す
  ```python
  spark.sql("""SELECT celsius, 
    reduce(
      celsius,        # 入力配列
      0,              # 初期値
      (acc, t) -> acc + t,        # 逐次更新の方法
      acc -> (acc div size(celsius) * 9 div 5) + 32     # 最終関数
    ) as avgFahrenheit 
    FROM tC
  """).show()
  ```
  ```python
  # 別の書き方
  spark.sql("""SELECT celsius, 
    reduce(
      celsius, 
      named_struct('sum', 0, 'cnt', 0), 
      (acc, t) -> named_struct('sum', acc.sum + t, 'cnt', acc.cnt + 1), 
      acc -> (acc.sum div acc.cnt * 9 div 5) + 32
    ) as avgFahrenheit 
    FROM tC
  """).show()
  ```

## 6章
### Datasetエンコーダ
- エンコーダはSpark内部のTungstenフォーマットからJVM Javaオブジェクトに変換（シリアライズ・デシリアライズ）
### Dataset利用時のコスト
- Datasetが高階関数に渡される場合、Spark内部のTungstenフォーマットからJVMオブジェクトにデシリアライズするためのコストが発生
- コスト削減のための戦略
  1. DSL式をクエリに使用し、高階関数の引数としてラムダを過剰に使用しない
  2. シリアライズとデシリアライズを最小限に抑えるためにクエリを連鎖させる
  ```Scala
  import java.util.Calendar
  val earliestYear = Calendar.getInstance.get(Calendar.YEAR) - 40

  Person(
    id: Integer, 
    firstName: String, 
    middleName: String, 
    lastName: String, 
    gender: String, 
    birthDate: String, 
    ssn: String, 
    salary: String
    )

  // シリアライズとデシリアライズが発生する場合 (効率悪い)
  personDS
  .filter(x => x.birthDate.split("-")(0).toInt > earliestYear) // Lambda
  .filter($"salary" > 80000) // DSL
  .filter(x => x.lastName.startsWith("J")) //Lambda
  .filter($"firstName".startsWith("D")) // DSL
  .count()
  ```
  ![DSLとLambda](DSL_and_Lambda.png, " ")
  ```Scala
  // DSLのみの場合 (効率良い)
  personDS
  .filter(year($"birthDate") > earliestYear) // Everyone above 40 
  .filter($"salary" > 80000) // Everyone earning more than 80K
  .filter($"lastName".startsWith("J")) // Last name starts with J
  .filter($"firstName".startsWith("D")) // First name starts with D
  .count()
  ```

## 7章
### Spark Configurationの表示と設定
- 設定項目は公式ドキュメントを参照
  - https://spark.apache.org/docs/3.5.2/configuration.html#spark-configuration
```python
from pprint import pprint
from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()
conf = spark.sparkContext.getConf()

# 表示
pprint(conf.getAll())

# 設定
conf.set({key}: {value})
```
### 動的リソース割り当て
- 動的リソース割り当てを有効にすると、大規模なワークロードの需要の増減に応じて、Spark Driverがコンピュートリソースを要求。使用していないときはExecutorを解放し、必要な時に新しいExecutorを取得。
- 動的リソース割り当ては、以下のような処理データ量が一定ではないケースで役立つ
  - データフロー量が不均一なストリーミング
  - 大量のSQLクエリのオンデマンド処理
- Config設定
  ```text
  spark.dynamicAllocation.enabled true
  spark.dynamicAllocation.minExecutors 2
  spark.dynamicAllocation.schedulerBacklogTimeout 1m
  spark.dynamicAllocation.maxExecutors 20
  spark.dynamicAllocation.executorIdleTimeout 2m
  ```
  - spark.dynamicAllocation.enabled  
    -> 動的リソース割り当ての有効化
  - spark.dynamicAllocation.minExecutors  
    -> Executorの作成数の下限
  - spark.dynamicAllocation.schedulerBacklogTimeout  
    -> スケジュールされていない保留中のTaskが、指定時間内に処理されなかった場合、Driverは新しいExecutorの起動を要求
  - spark.dynamicAllocation.maxExecutors  
    -> Executorの作成数の上限
  - spark.dynamicAllocation.executorIdleTimeout  
    -> ExecutorがTaskを終了して指定時間アイドル状態になると、DriverはExecutorを終了する
### Spark Executorのメモリ設定
- 各Executorが利用できるメモリ量は、spark.executor.memoryで制御される
- メモリは、実行メモリ、ストレージメモリ、予約メモリの3つのセクションに分かれている
  - 実行メモリ（デフォルト：60%）：shuffle, join, sort, aggregationで使用
  - ストレージメモリ（デフォルト：40％）：データ構造やDataFrameから派生したPartitionのCacheで使用
  - 予約メモリ（デフォルト：300MB）：OOMエラーに備えた予備
### 並列処理の最大化
- Partition：ディスク上の連続したデータを、設定可能で読み取り可能な塊やブロックのサブセットに配置する方法
- Spark jobの各Taskは個別のPartitionのデータを処理
- リソース利用を最適化し、並列性を最大化するには、Executor上のコア数とPartitionの数が同じ状態が理想
  ![並列性を最大化する状態](maximize_parallel.png, "並列性を最大化する状態")
- SparkのTaskはディスクからメモリに読み込まれたPartitionとしてデータを処理
- SparkのPartitionの最大サイズのデフォルト値は128MB
- ファイルサイズの小さいPartitionが多いと、ディスクI/Oが多くなり、パフォーマンスに影響を及ぼす
### データのキャッシュと永続化
- CacheとPersistenceはSparkでは同義だが、cache()とpersist()の2つのAPIコールには違いがあり、persist()はデータの保存方法と場所を詳細に制御可能
- cache()の利用による速度改善の比較
  ```python
  from pyspark.sql import SparkSession
  import time

  spark = SparkSession.builder.getOrCreate()

  # サンプルデータの生成
  data = [(i, i * 2, i * 3) for i in range(1, 1000001)] # 100万行のデータ
  columns = ["col1", "col2", "col3"]
  df = spark.createDataFrame(data, columns)

  # 重い計算を模倣するクエリ（集計処理）
  def perform_heavy_query(df):
      return df.groupBy("col1").agg({"col2": "sum", "col3": "max"})

  # キャッシュを使用しない場合
  start_time_no_cache = time.time()
  result_no_cache = perform_heavy_query(df).collect()
  end_time_no_cache = time.time()
  print(f"Execution time without cache: {end_time_no_cache - start_time_no_cache:.2f} seconds")

  # キャッシュを使用した場合
  df.cache()  # キャッシュを設定
  df.count()  # アクションを実行し、キャッシュをトリガー/マテリアライズ
  start_time_with_cache = time.time()
  result_with_cache = perform_heavy_query(df).collect()
  end_time_with_cache = time.time()
  print(f"Execution time with cache: {end_time_with_cache - start_time_with_cache:.2f} seconds")

  spark.stop() # SparkSessionの停止
  
  """
  Execution time without cache: 13.90 seconds
  Execution time with cache: 4.27 seconds
  """
  ```
- persist()の利用による速度改善の比較
  - persistはStorageLevelを介してデータのcache方法を制御可能（MEMORY_ONLY推奨）
    - MEMORY_ONLY  
      -> データはオブジェクトとしてメモリにのみ保存
    - MEMORY_ONLY_SER  
      -> データはシリアライズされメモリにのみ保存（データ使用時にデシリアライズが必要）
    - MEMORY_AND_DISK  
      -> データはオブジェクトとしてメモリに保存されるが、メモリが足りない場合の残りはシリアライズされてディスクに保存
    - DISK_ONLY  
      -> データはシリアライズされてディスクに保存
    - OFF_HEAP  
      -> データはオフヒープに保存
  ```python
  from pyspark.sql import SparkSession
  from pyspark import StorageLevel
  import time

  spark = SparkSession.builder.getOrCreate()

  # サンプルデータの生成
  data = [(i, i * 2, i * 3) for i in range(1, 1000001)] # 100万行のデータ
  columns = ["col1", "col2", "col3"]
  df = spark.createDataFrame(data, columns)

  # 重い計算を模倣するクエリ（集計処理）
  def perform_heavy_query(df):
      return df.groupBy("col1").agg({"col2": "sum", "col3": "max"})

  # persistを使用しない場合
  start_time_no_persist = time.time()
  result_no_persist = perform_heavy_query(df).collect()
  end_time_no_persist = time.time()
  print(f"Execution time without persist: {end_time_no_persist - start_time_no_persist:.2f} seconds")

  # persistを使用した場合
  df.persist(StorageLevel.DISK_ONLY)  # persistを設定
  df.count()  # アクションを実行し、persistをトリガー/マテリアライズ
  start_time_with_persist = time.time()
  result_with_persist = perform_heavy_query(df).collect()
  end_time_with_persist = time.time()
  print(f"Execution time with persist: {end_time_with_persist - start_time_with_persist:.2f} seconds")
  
  df.unpersist() # ストレージの解除
  spark.stop() # SparkSessionの停止
  
  """
  Execution time without persist: 14.29 seconds
  Execution time with persist: 3.68 seconds
  """
  ```
- cache()やpersist()の使い分け
  - 行うべきケース
    - 機械学習の学習に使われるDataFrame
    - ETLで頻繁に行われる変換のためによくアクセスされるDataFrame
  - 行わないほうが良いケース
    - メモリに収まりきらない大きさのDataFrame
    - 使用頻度の低いDataFrame
### Spark UIの確認
- Windowsでの確認方法
  1. %SPARK_HOME%/conf 内の spark-defaluts.conf に以下の設定を追記
    ```text
    spark.eventLog.enabled              true
    spark.eventLog.dir                  file:/C:/{log_path}    # {log_path}はログを保存する任意のパス
    spark.history.ui.port               18080                  # 過去のログをSpark UIで確認する際のポート
    spark.history.fs.logDirectory       file:/C:/{log_path}    # 過去のログを読み込むパス
    spark.history.retainedApplications  10                     # ログの保存数
    ```
  2. `cd %SPARK_HOME%\bin` でbinディレクトリに移動し、`spark-class org.apache.spark.deploy.history.HistoryServer` を実行
      - Linuxの場合は、`cd %SPARK_HOME%\sbin` でsbinディレクトリに移動し、`start-history-server.sh` を実行
- 確認可能な項目
  - Jobs  
    -> 各JobのDurationを確認でき、実行速度のボトルネックを調査可能
  - Stages  
    -> 各StageのDurationを確認でき、実行速度のボトルネックを調査可能
  - Storage  
    -> CacheされたすべてのテーブルやDataFrameの情報を確認可能
  - Environment  
    -> SparkのConfigに関して、GUI上で詳細に確認可能
  - Executors  
    -> 各Executorのメトリクスについて確認可能
  - SQL/DataFrame  
    -> クエリがいつどのJobで実行されたかを確認可能

## 8章
### 構造化ストリーミング
- https://spark.apache.org/docs/3.5.3/structured-streaming-programming-guide.html
- 構造化ストリーミングがサポートされているのは、インインクリメンタルに実行できるDataFrameオペレーションのみ
  - ステートレス・オペレーション
    - 該当オペレーション
      - 投影オペレーション：select, explode, map, flatmap, etc
      - 選択オペレーション：filter, where, etc
    - サポートモード：append, update, output
      - completeモードがサポートされていないのは、増加し続ける結果データの保持コストが高いため
  - ステートフル・オペレーション
    - 常に DataFrame.groupBy() or DataFrame.groupByKey() を使用する必要がある
    - ウィンドウによる集計  
      -> `streamDF.groupBy("{column_name}", window("{timestamp}", "10 minutes", "5 minutes")).count()`
    - watermarkによる遅延保障：指定時間内のデータは削除しない  
      -> `streamDF.withWatermark("{timestamp}", "10 minutes")groupBy("{column_name}", window("{timestamp}", "10 minutes", "5 minutes")).count()`
- ストリームデータの結合
  - Stream-Static：全ストリームデータに対して結合可能、1つのストリームデータを静的情報でエンリッチ化する際に使用
    - inner-join, left-join (StreamDFが左), right-join (StreamDFが右) をサポート
  - Stream-Stream：両方のデータソースがリアルタイムに変化する際に使用
    - inner-join, outer-join ともにサポート
- sessionizedStreamとセッションウィンドウ
  - 従来のリアルタイム処理では、flatMapGroupWithState()でカスタムのセッションウィンドウロジックが実装されていた
    - 本方法は以下のような課題がある
      - 手動でのステート管理
      - 組み込み集計関数の非対応
      - PySparkでの使用不可
  - session_window()により、動的なウィンドウサイズを持つセッションウィンドウを簡単に作成できるようになった
    - 新規イベントが発生するとウィンドウが開始
    - 状態管理の複雑さが低減
    - 集計処理の実装が簡素化
    - Pythonを含む複数言語で使用可能
- ストリーミングクエリを実行するSparkクラスタのパフォーマンスチューニング
  - ストリーミングクエリを実行するクラスタは常時稼働するため、過不足のないリソースのプロビジョニングが必要
  - Shuffle partitionをバッチクエリの時よりも小さい値に設定し、分割のオーバーヘッドを低減する
  - 急増するデータによる影響を小さくするために、ソースレート制限を設ける
  - 複数のストリーミングクエリを同一のSparkContextもしくはSparkSessionで実行し、クエリ間のリソース共有を可能にする

## 9章
###

## 10章
###

## 11章
###

## 12章
### 

## 参照
- https://waltyou.github.io/Learning-Spark-0/
- https://www.analyticsvidhya.com/blog/2022/07/spark-sql-for-relational-databases/
- https://www.modb.pro/db/70339
- https://towardsdatascience.com/6-recommendations-for-optimizing-a-spark-job-5899ec269b4b
- https://medium.com/@arjun289singh/a-comprehensive-overview-of-apache-spark-unleashing-the-power-of-distributed-computing-31aa0d1643fc
