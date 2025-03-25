+++
title = 'Databricks Certified Data Engineer Professional 試験勉強まとめ'
subtitle = ""
date = 2025-03-25
lastmod = 2025-03-25
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
## 試験勉強に使用した教材
### 公式
- [Data Engineer Professional Exam Guide](https://www.databricks.com/sites/default/files/2024-05/databricks-certified-data-engineer-professional-exam-guide.pdf)
- [Platform Architecture](https://www.databricks.com/trust/architecture)
- [クラシック コンピュート プレーン ネットワーキング](https://docs.databricks.com/aws/ja/security/network/classic)
- [アクセス制御リスト](https://docs.databricks.com/aws/ja/security/auth/access-control)
- [ETL のテーブルとビュー](https://docs.databricks.com/aws/ja/data-engineering/tables-views)
- [GDPR コンプライアンスのためのデータの準備](https://docs.databricks.com/aws/ja/security/privacy/gdpr-delta)
- [Databricks によるデータエンジニアリング](https://docs.databricks.com/aws/ja/data-engineering/)
- [予測的最適化 for Unity Catalog マネージドテーブル](https://docs.databricks.com/aws/ja/optimizations/predictive-optimization)
- [コンピュート構成の推奨事項](https://docs.databricks.com/aws/ja/compute/cluster-config-best-practices)
- [Databricks でテーブルをパーティション分割する場合](https://docs.databricks.com/aws/ja/tables/partitions)
- [リキッドクラスタリングを使用して Delta テーブル](https://docs.databricks.com/aws/ja/delta/clustering)
- [Delta Lake を構成してデータ ファイルのサイズを制御する](https://docs.databricks.com/aws/ja/delta/tune-file-size)
- [merge を使用した Delta Lake テーブルへのアップサート](https://docs.databricks.com/aws/ja/delta/merge)
- [Delta table ストリーミング 読み取りと書き込み](https://docs.databricks.com/aws/ja/structured-streaming/output-mode)
- [構造化ストリーミングの出力モードを選択する](https://docs.databricks.com/aws/ja/structured-streaming/batch-size)
- [Databricks で構造化ストリーミングのバッチサイズを構成する](https://docs.databricks.com/aws/ja/structured-streaming/batch-size)
- [Delta Lakeで チェンジデータフィードを使用する](https://docs.databricks.com/aws/ja/delta/delta-change-data-feed)
- [foreachBatch を使用して任意のデータシンクに書き込む](https://docs.databricks.com/aws/ja/structured-streaming/foreach)
- [パイプラインの期待値によるデータ品質の管理](https://docs.databricks.com/aws/ja/dlt/expectations)
- [Taking Apache Spark’s Structured Streaming to Production](https://www.databricks.com/blog/2017/05/18/taking-apache-sparks-structured-structured-streaming-to-production.html)
- [Apache Spark Structured Streaming Programming Guide](https://spark.apache.org/docs/latest/structured-streaming-programming-guide.html#structured-streaming-programming-guide)
- [public Structured Streaming API](https://api-docs.databricks.com/python/pyspark/latest/pyspark.ss/index.html)
- [Databricks REST API reference](https://docs.databricks.com/api/workspace/introduction)
- [ジョブ API 2.0](https://docs.databricks.com/aws/ja/reference/jobs-2.0-api)
- [Spark UI Simulator](https://www.databricks.training/spark-ui-simulator/index.html)
- [Web UI](https://spark.apache.org/docs/latest/web-ui.html)

### Udemy
- [Databricks Certified Data Engineer Professional - Preparation](https://www.udemy.com/course/databricks-certified-data-engineer-professional)
- [Practice Exams: Databricks Certified Data Engineer Professional](https://www.udemy.com/course/practice-exams-databricks-data-engineer-professional-k)

### その他
- [Databricks Certified Data Engineer Professional Exam](https://www.examtopics.com/exams/databricks/certified-data-engineer-professional/)
- [How Delta Lake Liquid Clustering conceptually works](https://dennyglee.com/2024/02/06/how-delta-lake-liquid-clustering-conceptually-works/)


## 試験結果
-  :  %
-  :  %
-  :  %
-  :  %
-  :  %

## 試験対策
| 質問 | 回答 | 補足・関連リンク |
|-----|-----|-----|
| 既存のクラスターのメトリクスとSpark UIを表示するためにデータエンジニアに必要な最小限の権限はどれか？ | クラスターに対する「Can Attach To」権限 | https://docs.databricks.com/aws/ja/security/auth/access-control#%E3%82%B3%E3%83%B3%E3%83%94%E3%83%A5%E3%83%BC%E3%83%88-acl |
| 次のコードを実行するとどうなる？ db_password = dbutils.secrets.get(scope="dev", key="database_password") print (db_password) | "REDACTED" と表示される | https://docs.databricks.com/aws/ja/security/secrets#%E3%82%B7%E3%83%BC%E3%82%AF%E3%83%AC%E3%83%83%E3%83%88%E7%B7%A8%E9%9B%86 |
| データ・エンジニアが %sh マジック・コマンドの使用を避ける理由は次のうちどれ? | Apache Spark ドライバーでのみ実行され、ワーカーでは実行されない（すべてのノードでシェル コマンドを実行するには、 initスクリプトを使用する） | https://docs.databricks.com/aws/ja/notebooks/notebooks-code#%E6%B7%B7%E5%90%88%E8%A8%80%E8%AA%9E |
| SELECT * FROM products WHERE price > 30.5 を実行する際に、クエリ・オプティマイザが読み込むデータ・ファイルを特定するために活用するのは次のうちどれ？ | Deltaトランザクションログ内の各データファイルの統計情報（１．レコードの総数、２．最初の 32 列の各列の最小値、３．最初の 32 列の各列の最大値、４．最初の 32 列の各列の Null 値の個数） | 質問のSELECTクエリでは、トランザクションログはprice列の最小値と最大値の統計を活用 |
| SHALLOW CLONE したテーブルでクエリ出来なくなる理由 | 参照先のテーブルが削除された（SHALLOW CLONEはデルタトランザクションログをコピーするだけ） | https://docs.databricks.com/aws/ja/delta/clone#%E3%82%AF%E3%83%AD%E3%83%BC%E3%83%B3%E3%81%AE%E7%A8%AE%E9%A1%9E |
| CREATE TABLE orders_archive DEEP CLONE orders でデルタレイクテーブル'orders_archive'を作成した。orders テーブルの新しい変更をクローンに同期させるコマンドはどれか？ | CREATE OR REPLACE TABLE orders_archive DEEP CLONE orders | DROP TABLE だとテーブルの履歴が消えるため、CREATE OR REPLACE TABLE を実行する |
| テーブルの差分情報を取得するスクリプト | SELECT * FROM daily_activities EXCEPT SELECT * FROM daily_activities@v{current_version-1} | https://docs.databricks.com/aws/ja/sql/language-manual/sql-ref-syntax-qry-select-setops |
| データエンジニアリングチームは、ソースシステムから変更データキャプチャ（CDC）フィードとして顧客データを受信するパイプラインを構築したいと考えている。ソースで記録される CDC イベントには、レコードのデータとメタデータ情報が含まれる。このメタデータは、指定されたレコードが挿入・更新・削除されたかを示す。さらに、フィールドupdate_timeで識別されるタイムスタンプ列が、変更が発生した順序を示す。各レコードは customer_id フィールドで識別される主キーを持つ。同じバッチで、同じ顧客に対する複数の変更が、異なる update_time で受信される可能性があり、チームはターゲットとなる Delta Lake テーブルに、各顧客の最新の情報のみを保存したいと考えています。これらの要件を満たすソリューションは次のうちどれ？ | MERGE INTOを使用して、各顧客IDの最新のエントリーをテーブルにアップサートする | https://docs.databricks.com/aws/ja/delta/merge |
| データ・エンジニアリング・チームは、'orders_raw'というシングルプレックスのブロンズ・テーブルを持っており、そこに毎晩新しい注文データが追加される。彼らは、より洗練された受注データのビューを提供するために、'orders_cleaned'という新しいシルバーテーブルを作成した。チームは、orders_rawテーブルに挿入されたすべての新しいレコードを処理し、orders_cleanedテーブルに伝播するバッチ処理パイプラインを作成したいと考えている。このデータのバッチを伝播するための計算コストを最小化するソリューションはどれか？ | Spark Structured Streamingを使用して、トリガーのavailableNowオプションを使用して、バッチモードでorders_rawから新しいレコードを処理 | https://docs.databricks.com/aws/ja/structured-streaming/triggers#%E5%A2%97%E5%88%86%E3%83%90%E3%83%83%E3%83%81%E5%87%A6%E7%90%86%E3%81%AE%E6%A7%8B%E6%88%90 |
| データ・エンジニアリング・チームには 'sales_cleaned' という Silver テーブルがあり、新しい売上データがほぼリアルタイムで追加される。彼らは、'sales_cleaned' テーブルに対して新しいゴールドレイヤーを作成し、売上金額のYTD（year-to-date）を計算したいと考えている。この指標は毎日1回再計算されれば十分だが、これらのメトリクスは複数のビジネス・チームから非常に頻繁に照会されるため、データ・エンジニアリング・チームは、潜在的なコストと結果の実体化に関連する待ち時間を削減したいと考えている。これらの要件を満たすソリューションは、次のうちどれか？ | 夜間バッチ・ジョブを構成してメトリクスを再計算し、更新ごとに上書きされるテーブルとして保存（テーブルが頻繁に参照される場合は、ビューではなくテーブル化したほうが良い） |  |
| MLFlowの登録モデルをSpark UDFとして使用し、テストデータセットに対する予測を行うスクリプト | predict_udf = mlflow.pyfunc.spark_udf(spark, "model_url") ｜pred_df = data_df.withColumn("prediction", predict_udf(*column_list)) | https://mlflow.org/docs/latest/api_reference/python_api/mlflow.pyfunc.html#mlflow.pyfunc.spark_udf |
| Auto Optimize はどのような機能か？ | デルタテーブルの小さなデータファイルを自動的にコンパクトにする機能（デルタテーブルへの個々の書き込み中に実行される）。 | オート・オプティマイズは、2つの補完的なオペレーションで構成されている。１．最適化された書き込み：各テーブルパーティションに対して128MBのファイルの書き込みを試す。２．自動コンパクション：個々の書き込みの後、ファイルがさらにコンパクト化できるかどうかをチェックし、可能な場合、128 MBのファイルサイズのままでOPTIMIZEジョブを実行。 |
| データエンジニアリングチームには、新しい変更が頻繁にマージされる大規模な外部デルタテーブルがある。彼らは、小さなデータ・ファイルを自動的に128MBのファイルにコンパクト化するために、このテーブルで最適化された書き込みと自動コンパクションを有効にした。しかし、テーブルのディレクトリを見ると、ほとんどのデータファイルが128MBより小さいことがわかった。このようなファイルサイズの小ささを説明している可能性が高いのは、次のうちどれ？ | 最適化された書き込みとオートコンパクションは、自動的に小さなデータファイルを生成し、将来のMERGE操作の時間を短縮する。 | MERGE 操作は、大きなファイルに対して実行すると非常にコストがかかるため、頻繁に変更が発生するテーブルでは、将来の MERGE 操作を高速化するために小さなファイルが生成されることがある。 |
| Stream-Stream Joinsにおけるストリーミング状態に関する記述のうち、正しいものはどれ？ | Sparkは両方の入力ストリームに対して、過去の入力をストリーミング状態としてバッファリングし、将来のすべての入力を過去の入力と照合できるようにする。（Watermark を使用することで過去の有効期間を定めることが可能） | https://www.databricks.com/blog/2018/03/13/introducing-stream-stream-joins-in-apache-spark-2-3.html |
| Stream-Static Joinsにおける静的デルタテーブルに関する記述のうち、正しいものはどれ？ | スタティックデルタテーブルの最新バージョンは、Stream-Static Joinsのマイクロバッチによってクエリされるたびに返される。 |  |
| 到着が遅れたデータを処理するために、ストリーミング状態の情報を30分間維持したい。この要件を満たす機能はどれか？ | .withWatermark("order_timestamp", "30 minutes") |  |
| Spark Structured Streamingのチェックポイントの特徴 | １．ストリーミング・ジョブの現在の状態をクラウド・ストレージに保存｜２．write-ahead logs (データベースやシステムがデータを変更する前に、その変更内容をログに書き込むことで、システムがクラッシュした場合でも、ログを参照して処理の再実行や復旧を可能にする仕組み) によるチェックポイントは、フォールト・トレラントなストリーム処理を保証 | https://www.databricks.com/blog/streaming-production-collected-best-practices |
| Auto Compaction について適切な記述 | Auto Compactionは、テーブルへの書き込みが成功した後に発生し、ファイルがさらにコンパクト化できるかどうかをチェックし、可能な場合、ファイルサイズが128MB (標準のOPTIMIZEは1GB) に近づくように、Z-Orderなし (Z-Orderingは単なるコンパクションよりも大幅にコストがかかる) でOPTIMIZEジョブを実行。 |  |
| Auto Loader について適切な記述 | オートローダーは、ファイルが蓄積されるソースの場所を監視し、コマンドを実行するたびに新しい到着ファイルのみを識別して取り込む（以前の実行ですでに取り込まれたファイルはスキップされる） | https://docs.databricks.com/aws/ja/ingestion/cloud-object-storage/auto-loader |
| ストリーミング重複排除を正しく実行できるアプローチはどれか？ | 各バッチ内でレコードの重複を除去し、挿入のみのマージを使用して結果をターゲットテーブルにマージする。 | https://docs.databricks.com/aws/ja/delta/merge#delta-%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AB%E6%9B%B8%E3%81%8D%E8%BE%BC%E3%82%80%E3%81%A8%E3%81%8D%E3%81%AE%E3%83%87%E3%83%BC%E3%82%BF%E9%87%8D%E8%A4%87%E9%99%A4%E5%8E%BB |
| ジュニア・データ・エンジニアが、前回のテーブル更新以降に 'sales' テーブルに追加された各アイテムの最新エントリを取得するために、ストリーミングDataFramesを使用しているが、コマンドを実行すると失敗する。何が原因として考えられる？ | 非時間ベースのウィンドウ操作はサポートされていないので、代わりに foreachBatch ロジックの中に実装する必要がある。(Non-time-based window operations are not supported on streaming DataFrames エラーが発生) | ストリーミングでサポートされている時間ベースのウィンドウ操作として、タンブリングウィンドウとスライディングウィンドウがある |
| Change Data Feedが有効になっているDeltaテーブル'customers'に対して、以下のクエリを実行した場合の結果はどうなる？`spark.readStream.option("readChangeFeed", "true").option("startingVersion", 0).table ("customers").filter (col("_change_type").isin(["update_postimage"])).writeStream.option ("checkpointLocation", "dbfs:/checkpoints").trigger(availableNow=True).table("customers_updates")` | 更新後（update_postimage）のレコードがターゲットテーブルにAppend（デフォルトの出力モード）される |  |
| データエンジニアリングチームは、毎晩ソースシステムから受信した新しいデータで上書きされるタイプ 1 のテーブルを管理している。あるジュニア・データ・エンジニアは、更新、挿入、または削除された行を識別するために、テーブルの変更データ・フィード（CDF）機能を有効にすることを提案した。ジュニア・データ・エンジニアの提案に対する回答として正しいものはどれか。 | CDFは、各バッチでごく一部のレコードしか更新されない場合に有用であり、テーブルのほとんどのレコードが更新される場合や、質問のようにバッチごとにテーブルが上書きされる場合は、CDFを使用しない。(各バッチで更新されるレコードがごく一部である場合にCDFを使う。このような更新は通常、CDC形式で外部ソースから受信される。) | https://www.databricks.com/blog/2021/06/09/how-to-simplify-cdc-with-delta-lakes-change-data-feed.html |
| あるデータエンジニアが GRANT USAGE ON DATABASE sales_db TO finance_team を実行する際の、USAGE権限の利点は何か？ | USAGEは何かしらのケイパビリティを与えるわけではないが、スキーマに対して何らかのアクションを実行するために必要な権限 | https://docs.databricks.com/aws/ja/data-governance/table-acls/object-privileges#usage-%E7%89%B9%E5%85%B8 |
| user_id LONG, page STRING, activity_type LONG, ip_address STRING, activity_time TIMESTAMP, activity_date DATE このスキーマに関して、どの列がデルタテーブルのパーティショニングに適しているか？ | activity_date | パーティショニング・カラムを選択する際には、ある値を持つレコードが無期限に到着し続けることを考慮するとよい。datetimeカラムをパーティショニングに使用することで、必要に応じて以前の期間のパーティションを簡単にアーカイブ可能。 |
| データ品質を強化するために、データエンジニアは ALTER TABLE users ADD CONSTRAINT valid_age CHECK (age> 0)； コマンドでテーブルにCHECK制約を追加することにしたが、コマンドを実行すると失敗した。この失敗の原因はどれ？ | 新しい制約に違反する行がテーブルに既に含まれている。 | テーブルに制約を追加する前に、既存のすべての行が制約を満たす必要がある。 |
| 制約と列コメントの両方がテーブルに正常に追加されたことを確認できるコマンドはどれ？ | DESCRIBE EXTENDED | 制約は Table Properties に表示される |
| ジョブの「CAN MANAGE」権限を持つデータエンジニアが、Databricks ジョブ UI を使って、「Owner」 権限を 「finance」 グループに移譲しようとしているが失敗が続いている。この失敗の原因は次のうちどれ？ | ジョブのオーナーにグループは設定出来ず、ユーザーを指定する必要がある |  |
| データエンジニアリングチームは、パーティショニングされたデルタレイクテーブルが非常に苦しんでいることに気づいた。このテーブルのほとんどの一般的なクエリでスローダウンが発生している。チームはこのテーブルでOPTIMIZEコマンドを実行したが、問題を解決することはできなかった。これらの速度低下の原因を説明している可能性が高いのは次のうちどれか？ | テーブルがオーバー・パーティションになっているか、間違ったパーティションになっている。この問題を解決するには、すべてのデータ・ファイルを完全に書き換える必要がある。 |  |
| データ・エンジニアリング・チームには、本番ワークスペースのDataOpsエンジニアが必要とするすべてのシークレットを含む「DataOps-Prod」という名前のシークレット・スコープがある。DataOpsエンジニアがこのスコープ内のシークレットを使用するために必要な最小権限は次のうちどれ？ | “DataOps-Prod” スコープのREAD権限 | https://docs.databricks.com/aws/ja/security/auth/access-control#%E3%82%B7%E3%83%BC%E3%82%AF%E3%83%AC%E3%83%83%E3%83%88-acl |
| あるデータエンジニアが Databricks REST API を使用して、エンドポイント 'api/2.1/jobs/runs/get' に GET リクエストを送信し、run_id を使用してマルチタスクジョブのランのメタデータを取得している。APIコールのレスポンス構造を正しく説明しているのはどのステートメントか？ | ジョブ実行の各タスクは一意の run_id を持つ | https://docs.databricks.com/api/workspace/jobs/getrun |
| DBFSについての記述として適切なものは？ | Databricksワークスペースにマウントされ、Databricksクラスタで利用可能な分散ファイルシステム。スケーラブルなオブジェクトストレージの抽象化であり、Unixライクなファイルシステムの呼び出し（ストレージURLではなく、ディレクトリやファイルのパスを使って操作）をネイティブなクラウドストレージAPIの呼び出しにマッピングする。 | https://docs.databricks.com/aws/ja/dbfs |
| Pythonの変数sys.pathについて正しく説明しているものはどれ？ | sys.path変数にはPythonインタプリタがモジュールを検索するディレクトリのリストが含まれている | https://docs.databricks.com/aws/ja/files/workspace-modules?language=Python#python%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB%E3%81%A8r%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%9D%E3%83%BC%E3%83%88 |
| Databricks REST API経由で既存のジョブを実行する場合、新しくトリガーされたRunのグローバルユニーク識別子を表すのは次のうちどれ？ |run_id |  |
| 本番のStructured Streamingジョブでは、どのような再試行ポリシーを使用することをお勧めしますか？ | リトライ回数無制限、最大同時実行回数1回 |  |
| データエンジニアは、モデルUDFを test_df DataFrameに適用して、新しい列 prediction の予測値を計算したい。どのコードを使う？ | test_df.select(“record_id”, predict_udf(*column_list).alias("prediction")) |  |
| CDFの保持ポリシーとして正しいものは？ | テーブル上でVACUUMコマンドを実行すると、CDFデータも削除される |  |
| あるデータ・エンジニアは、ストリーミング・デルタ・テーブル 'activity_logs' と静的デルタ・テーブル 'users' の結合結果によって、'user_activities' というデルタ・テーブルを更新するストリーミング・ジョブを持っています。彼らは、'users'テーブルに新しいユーザを追加しても、'user_activities'テーブルが自動的に更新されないことに気づきました。この問題を説明しているのは、次のうちどれでしょうか？ | stream-static joinでは、ストリーミングデータがjoinプロセスを駆動し、静的テーブルに新しいレコードを追加しても、ストリーム静的結合の結果に対する更新は自動的にトリガされない |  |
| 次のクエリの実行結果の説明として正しいものは？ `spark.read.option("readChangeFeed", "true").option("startingVersion", 0).table ("customers").filter (col("_change_type").isin(["update_postimage"])).write.mode("append").table("customers_updates")` | spark.readを使用してCDFでキャプチャされたテーブルの変更を読み込む、すなわち静的なソースとして（指定されたstartingVersionから始まる）すべてのテーブルの変更を読み込む | https://docs.databricks.com/delta/delta-change-data-feed.html#read-changes-in-batch-queries |
| チームはテーブルに新しいレコードを一括挿入しようとしましたが、負の年齢値を持つレコードがいくつかあり、CHECK制約違反のため書き込みに失敗した。この一括挿入の結果を説明する文はどれか。 | どのレコードも挿入されない |  |
| Delta Lake File Statisticsについて正しいのは？ | 構造化された項目はネストされたフィールドごとに1つの列としてカウントされる |  |
| SCD Type 0 の定義はどれか？ | 変化のないテーブル | https://en.wikipedia.org/wiki/Slowly_changing_dimension |
| Databricks上のテーブルのクローンに関する次の記述のうち、正しいものはどれですか？ | ディープ・クローンまたはシャロー・クローンに加えられた変更は、クローン自体にのみ影響し、ソース・テーブルには影響しない | https://docs.databricks.com/aws/en/delta/clone#what-are-the-semantics-of-delta-clone-operations |
| パイプラインのすべてのテーブルでデータ・スキップを活用するために、オート・コンパクションでZオーダー・インデックスを有効にする方法は？ | Auto CompactionはZ-Orderingをサポートしていないため、Z-Orderingインデックスを有効にする方法はない |  |
| データエンジニアリングチームは、'user_posts' という名前の、'year' カラムでパーティショニングされた大きな Delta Lake テーブルを持っている。このテーブルは、ストリーミングジョブの入力ストリーミングソースとして使用される。ストリーミング・ソースのアペンド・オンリーの要件を破ることなく、テーブルから過去2年間のデータを削除したい。パーティションを削除した後、テーブルからストリーム処理を有効にするには、どのオプションの使用が正しいか？ | `.option("ignoreDeletes", True)` | https://docs.databricks.com/aws/ja/structured-streaming/delta-lake#ignore-updates-and-deletes |
| MERGE INTOコマンドを使用する際の制限事項はどれですか？ | 複数のソース行が一致し、テーブル内の同じターゲット行を変更しようとした場合、マージは実行できない（ソース・テーブルを前処理して複数の行が一致する可能性を排除する必要がある） |  |
| ターゲットテーブルにデータをアップサートするforeachBatchロジックを使用する際に、関数内でクエリを実行するコマンドは？ | `microBatchDF.sparkSession.sql(sql_query)` | https://docs.databricks.com/gcp/en/structured-streaming/delta-lake#upsert-from-streaming-queries-using-foreachbatch |
| メッセージ列に対してフィルタを使用してクエリを実行すると、クエリ速度が遅く、パフォーマンスに問題があった。これはなぜか？ | カーディナリティの高い文字列フィールドの統計情報を利用するのに時間がかかるため |  |
| `CREATE DATABASE db_hr; USE db_hr; CREATE TABLE employees;` このコマンドを実行した際に、テーブルが保存される場所は？ | dbfs:/user/hive/warehouse/db_hr.db |  |
| 次のビューによって返される結果はどれですか? `CREATE VIEW students_vw AS SELECT * FROM students WHERE CASE WHEN is_member("instructors") THEN TRUE ELSE is_active IS FALSE END` | 講師グループのメンバーのみ、アクティブかどうかに関わらず、すべての学生の記録を見ることができ、指定されたグループのメンバーでないユーザは、アクティブでない学生の記録のみを見ることができる | https://docs.databricks.com/aws/en/data-governance/table-acls/object-privileges#dynamic-view-functions |
| あるデータエンジニアが Databricks REST API を使って 'process-sales' というジョブを作成しようとした。しかし、誤ってエンドポイント 'api/2.1/jobs/create' に 2 つの POST リクエストを送信した。これらのリクエストの結果を説明する文はどれか？ | job_idが異なる process-sales という同名の2つのジョブがワークスペースに作成される |  |
| あるデータエンジニアが Databricks REST API を使用して、run_id を使用して実行したジョブのメタデータを取得したいと考えている。この要件を満たす REST API 呼び出しはどれ？ | ‘api/2.1/jobs/runs/get’ へのGETリクエスト |  |
| Databricks Jobs APIに指定されたバッチデータの日付をパラメータとして渡すように上流システムが設定されている。日付変数を作成するには、どのコードブロックを使用する必要があるか？ | `dbutils.widgets.text("date", "null") date = dbutils.widgets.get("date")` |  |
| 数百万のユーザ・アカウントがあり、毎時数万レコードが処理されると仮定した場合、毎時のバッチ・ジョブの一部として account_current テーブルを効率的に更新するには、どの実装を使用できますか? | account_historyのレコードを、last_updatedフィールドと最新の処理時間、およびuser_idごとの最大last_ioginを使用してフィルタリングし、各 user_id の最新の値を更新または挿入するマージ・ステートメントを使用 |  |
| 過去24時間以内に変更されたレコードの予測にのみ興味がある。これらの変更されたレコードの識別を簡単にするアプローチはどれか？ | 現在の上書きロジックを、変更されたレコードのみを変更するmergeステートメントに置き換え、変更データフィードによって識別された変更されたレコードに対して予測を行うロジックを記述 |  |
| 外部Change Data Captureフィードからの更新を、Structured Streamジョブを使ってDelta Lakeテーブルに適用している。初期データ移行時にOPTIMIZEを実行し、ほとんどのデータファイルは1 GBにリサイズされた。Auto OptimizeとAuto Compactionの両方が有効化されている。最近のデータファイル確認で、ほとんどのファイルが64 MB未満になっている。各パーティションには少なくとも1 GBのデータがあり、テーブル全体は10 TB以上である。この小さなファイルサイズの原因として考えられるのは、次のうちどれでしょうか？ |  MERGE 操作の期間を短縮するために、より小さなターゲットファイルサイズに自動調整した  |  |
| stream-static joins and static Delta tablesに関する記述のうち、正しいものはどれですか？ | 各マイクロバッチのstream-static joinは、ジョブがトリガーされた際の最新バージョンの静的Deltaテーブルを使用 |  |
| プロダクション環境にデプロイされたStructured Streamingジョブが、ピーク時に遅延している。通常の実行では、各マイクロバッチの処理時間は3秒未満ですが、ピーク時には30秒を超えることがある。トリガー間隔は10秒に設定されている。レコードを10秒以内に処理する必要があるという条件の下で、どの調整が要件を満たすか？ | トリガー間隔を5秒に減らす。バッチをより頻繁にトリガーすることで、レコードのバックアップや大規模なバッチによるスピルを防ぐ |  |
| 以下の各構成は、各クラスタに合計400GBのRAM、合計160のコア、およびVMごとに1つのエクゼキュータがあるという点で同一です。少なくとも1つのワイド変換を含むジョブがある場合、次のクラスタ構成のうちどれが最大のパフォーマンスになりますか? |  • Total VMs: 8 • 50 GB per Executor • 20 Cores per Executor | https://www.databricks.com/discover/pages/optimize-data-workloads-guide#number-workers（ワイドトランスフォーメーションを含むか否かで変わる） |
| パイプラインの次のテーブルにまだ処理されていない新しいレコードを操作するために使用できるオブジェクトを返す関数定義を完成させるコード・スニペットはどれか？ | return spark.readStream.table("bronze") |  |
| データエンジニアは、データの高度にネスト化された構造と多数のフィールドを考慮して、スキーマ宣言に対処する最良のアプローチを決定しようとしています。Delta Lake と Databricks に関する情報のうち、意思決定プロセスに影響を与える可能性があるものを、的確に示しているものはどれですか？ | Databricksはすべての観測データを処理できるように型を推論するため、手動で型を設定することでデータ品質の強制がより確実になる |  |
| 米国に本社を置くある小さな会社は最近、インドのコンサルティング会社と契約した。同社のデータはすべて、米国内の地域クラウドストレージに保存されている。この会社のワークスペース管理者は、請負業者が使用するDatabricksワークスペースをどこに配置すべきか迷っている。データガバナンスに関するすべての考慮事項が説明されていると仮定して、この決定を正確に伝える記述はどれですか？ | クロスリージョンの読み取りと書き込みは大幅なコストと遅延を引き起こす可能性があります。可能な限り、コンピューティングはデータが保存されているのと同じリージョンにデプロイする必要があります。 |  |
| LOCATION句を使用して作成したスキーマのパスに、テーブルを作成した場合、そのテーブルはどうなる？ | LOCATION句で指定したパスの配下に、マネージドテーブルが作成される（スキーマは外部だが、テーブルはマネージド） |  |
| Databricks Secrets の注意事項はどれですか？ | シークレット文字列の変数をイテレータとして使用することで、1文字ずつ表示できてしまう |  |
| ジョブの実行履歴の保持に関して正しい記述は？ | 60日間保持され、その間はノートブックの実行結果をHTMLにエクスポート可能 |  |
| あるプロダクションクラスタには3つのエクゼキュータノードがあり、ドライバとエクゼキュータに同じ仮想マシンタイプを使用している。このクラスタのGanglia Metricsを評価する場合、ドライバ上で実行されるコードによるボトルネックを示す指標はどれか？ | 全体のCPU使用率が25％程度になっている | 全体的なCPU使用率が約25%という低さは、全リソースの約1/4しか使用されていないことを意味し、これは3台のエグゼキューターと1台のドライバーの合計4台で考えると、1台分（ドライバー）だけが活発に処理を行い、他の3台（エグゼキューター）がほとんど活用されていない状態を示唆している |
| Spark UIでプレディケートプッシュダウンを活用していないことによるパフォーマンス問題を診断する方法は？ | クエリ詳細画面で、物理実行プラン（Physical Plan）を解釈する | プッシュダウンが行われていない場合、プランには不必要に大量のデータを読み込んでから、Sparkエンジン内でフィルタリングしていることが示される |

## 知識
### Databricks アーキテクチャ
[Platform Architecture](https://www.databricks.com/trust/architecture)

- コントロールプレーンとサーバレスコンピュートプレーン間の接続は、パブリックインターネットではなく、常にクラウドネットワークバックボーン経由
- コントロールプレーンと従来のコンピュートプレーン間の接続
  - セキュアなクラスター接続
    - 顧客 VPC にはオープンポートがなく、クラシックコンピュートプレーンリソースにはパブリック IP アドレスがない
    - クラスター・ノード上のパブリックIPアドレスを必要とせずに、HTTPS(ポート443)を使用したセキュア・トンネルを介してクラスターがコントロール・プレーンに接続
  - VPC Peering（VPCピアリング）
    - Databricksが提供するコントロールプレーンと、ユーザーのクラウド環境のVPCをピアリングして通信を確立
  - プライベート接続の有効化
    - AWS PrivateLinkを使用して、クラシックコンピュートプレーンからコントロールプレーンへのプライベート接続を確立

### ドライバーノードのターミナル表示
- View タブ → Web Terminal からドライバーノードのターミナルを表示可能

### Delta Lake
#### 特徴
- マネージドテーブル、外部テーブルともに適用可能（マネージドテーブルは Delta Lake 形式のみサポート）
- ACIDトランザクションを保証
- バッチ・ストリーミング処理を統一されたインターフェースで提供
- データファイルをParquetとして、トランザクションログをJsonとして保持
- トランザクションログを使用して、テーブルに対する変更を確認し、以前のテーブルバージョンをクエリ可能
- 書き込み時にスキーマを検証し、テーブルに書き込まれたすべてのデータが設定した要件と一致することを確認
- メタデータ解析と物理データレイアウトを組み合わせて、ファイルIOの数を減らし、処理の高速化を実現
- 10コミットごとに、それまでのトランザクションの内容が集約されたチェックポイントファイルが作成され、作成後はこのファイルとそれ以降のJSONログを読み込むだけで済むため、ログの読み取りコストが低減し、高速なデータアクセスが可能になる。さらにログファイルの効率的な管理にもつながる。
  - チェックポイントファイルの中身を確認するコード
    ```python
    display(spark.read.parquet(f"{save_path}/_delta_log/00000000000000000010.checkpoint.parquet"))
    ```
- Deltaテーブルの特定の機能を削除することも可能
  - コード
    ```sql
    ALTER TABLE <table-name> DROP FEATURE <feature-name>
    ```
  - 削除可能な機能
    - checkConstraints
    - collations-preview
    - columnMapping
    - deletionVectors
    - typeWidening-preview
    - v2Checkpoint
#### Liquid Clustering
- 特徴
  - 高速で柔軟
  - 過剰パーティショニングや過少パーティショニングに陥ることなく、適切なパーティショニングを自律的に実現
  - 新規データに対しても、逐次的に部分クラスタリングを実施
  - 一貫したファイルサイズを維持し、データのスキューに頑健
  - 並行処理により適している
  - ストリームテーブルやマテリアライズドビューを含む、全てのDeltaテーブルで適用可能
  - パーティション分割や ZORDERと互換性がない
- 恩恵のあるシナリオ
    - カーディナリティの高い列によってフィルタリングされることが多いテーブル
    - データの分散に大きな偏りがあるテーブル
    - 急速に増大し、メンテナンスとチューニングが必要となるテーブル
    - 並列書き込み要件のあるテーブル
    - 時間の経過と共に変化するアクセスパターンを持つテーブル
    - 一般的なパーティションキーでは、パーティションが多すぎたり少なすぎたりするテーブル
- クエリ
  - 新規作成：`CREATE OR REPLACE TABLE new_table CLUSTER BY col AS (SELECT * FROM source_table)`
  - 既存テーブルへの適用：`ALTER TABLE table CLUSTER BY col`
#### Deletion Vectors
- 特徴
  - 従来のDelta Lakeでは、行を削除・更新する際に、該当するデータファイル全体を書き換える必要があったが、Deletion Vectorsを用いることで、削除・更新された行を論理的にマークするだけで、物理的なデータファイルの書き換えを遅延させることが可能となり、処理が高速になる
  - 削除・更新・結合（Merge）はDeletion Vector File (削除または更新された行の情報を保持する別ファイル) に記録
  - 物理的なデータファイルの書き換えは、OPTIMIZEコマンド実行時・オートコンパクション実行時・`REORG TABLE ... APPLY (PURGE)`実行時に発生
- 恩恵
  - 大規模なテーブルでの削除および更新操作が高速化
  - データファイルの書き換え回数が減るため、ストレージコストを削減
  - 削除・更新操作と同時に、他のクエリを実行できるようになり、コンカレンシーが向上
- 注意点
  - 削除ベクトルを有効にすると、テーブルプロトコルがアップグレードされ、削除ベクトルをサポートしていない Delta Lake クライアントでは、テーブルを読み取ることができなくなる
  - マテリアライズドビューまたはストリーミングテーブルを作成するときは手動で有効にする必要がある (ALTERステートメントは使用できず、CREATE時に有効化が必要 (`CREATE TABLE <table-name> [options] TBLPROPERTIES ('delta.enableDeletionVectors' = true);`))
#### CDF (チェンジデータフィード)
- Deltaテーブルのバージョン間の行レベルの変更を追跡
- CDFを有効化する方法
  - 新規テーブル：`CREATE TABLE student (id INT, name STRING) TBLPROPERTIES (delta.enableChangeDataFeed = true)`
  - 既存テーブル：`ALTER TABLE myDeltaTable SET TBLPROPERTIES (delta.enableChangeDataFeed = true)`
- チェンジデータフィードを読み取る場合は、オプション readChangeFeed を true に設定 (`.option("readChangeFeed", "true")`)
- ターゲットテーブルに、特定の時点 (N) までに適切な変更が加えられたすべてのレコードがすでに含まれている場合は、次の時点 (N＋1) の開始バージョンを指定 (`.option("startingVersion", N＋1)`)
- チェンジデータフィードには、Deltaテーブルのスキーマのデータ列に加えて、変更イベントの種類を識別するメタデータ列が含まれる
  - _change_type：insert, update_preimage , update_postimage, delete (1)
  - _commit_version：変更を含むDeltaログまたはテーブルのバージョン
  - _commit_timestamp：コミットが作成されたときに関連付けられたタイムスタンプ
- 変更データはテーブル ディレクトリの下の _change_data フォルダーに記録される
#### 列マッピング
- 特徴
  - メタデータのみの変更で、データ ファイルを書き換えることなく列を削除または名前変更を実施可能
  - Parquet で許可されていない文字 (スペースなど) を使用して Delta テーブルの列に名前を付けることができるため、文字制約による列名の変更を行わずとも、CSV または JSON データを Delta に直接取り込み可能となる
- コード
  - 列名変更：`ALTER TABLE <table-name> RENAME COLUMN old_col_name TO new_col_name`
  - 列の削除：`ALTER TABLE table_name DROP COLUMNS (col_name_1, col_name_2, ...)`
#### 生成列
| 特徴 | GENERATED ALWAYS | GENERATED BY DEFAULT |
|---|---|---|
| 値の生成 | 常に式に基づいて自動生成 | デフォルトで式に基づいて自動生成 |
| ユーザーによる値の指定 | 不可 | 可能 |
| 目的 | データの整合性の厳格な維持 | デフォルト値の自動生成と柔軟な上書き |
| 値の優先度 | 常に生成された値が優先 | ユーザーが指定した値が優先 |
| 利用場面 | 常に特定のルールに従って生成される値を保証したい場合 | デフォルトでは自動生成された値を使用し、必要に応じてユーザーが値を上書きできるようにしたい場合 |
#### ベストプラクティス
- テーブル削除をディレクトリ全体を削除として実行するのではなく、`REPLACE TABLE`による上書きを実行する
  - ディレクトリを再帰的にリストアップしたり、ファイルを削除したりする必要がないため、はるかに高速
  - 古いバージョンのテーブルが存在するため、タイムトラベル可能
  - アトミックなオペレーションであり、同時実行クエリーは、テーブルを削除している間もテーブルを読み取ることが可能
  - ディレクトリ全体を削除するよりも、Vacuumを使用して古いファイルを削除するほうが高速
- データ破損やデータ損失の問題を回避するために、Databricks では、S3 に格納されている同じ Delta テーブルを異なるワークスペースから変更しない

### パフォーマンス最適化
- キャッシュ
  - ディスクキャッシュ
    - Databricks独自の機能 (Delta Lakeとの関係なし)
    - ファイルをリモートのロケーションからフェッチする必要がある場合、データは自動的にキャッシュ
    - ワーカー ノードで提供されるローカル SSD で使用可能なスペースの最大半分を使用するように構成される
  - Apache Sparkキャッシュ
    - Sparkで頻繁にアクセスするデータフレームをキャッシュする機能
  - 比較表
    | 機能 | ディスクキャッシュ | Apache Sparkキャッシュ |
    |------|-------------------|----------------------|
    | 保存形式 | ワーカーノード上のローカルファイルとして保存 | メモリ内ブロック |
    | 適用対象 | S3、ABFS、およびその他のファイルシステムに保存されているすべての Parquetテーブル | 任意のDataFrameまたはRDD |
    | トリガー | 最初の読み取り時に自動的に実行（キャッシュが有効な場合） | コードの変更が必要 |
    | 評価 | 遅延評価 | 遅延評価 |
    | 可用性 | 構成フラグを使用して有効または無効にすることができ、特定のノードタイプではデフォルトで有効 | いつでも利用可能 |
    | 排除 | LRU方式またはファイル変更時に自動で、クラスターの再起動時に手動で排除される | LRU方式では自動的に、unpersist では手動で排除される |
- 動的ファイルプルーニング
  - フィルタ文やWHERE句を含むクエリに対して適用される
  - パーティション化されていないテーブルや、パーティション化されていないカラムのジョインに特に効率的
  - 有効な条件
    - Photonが使用されていない時：SELECT のみ有効
    - Photonが使用されている時：MERGE, UPDATE, DELETE でも有効
- Predictive I/O
  - データのスキャンと読み取りにかかる時間を短縮
  - 更新、削除、およびマージ中に書き換える必要のあるデータの量を削減
  - Databricks の Photon エンジン専用の機能
  - ディープラーニング技術を活用
- CBO（コストベースオプティマイザ）
  - テーブルと列の統計を収集し、適切なクエリ順序に組み換え
- AQE (アダプティブクエリ実行)
  - クエリの実行中に発生するクエリの再最適化
  - シャッフルおよびブロードキャスト終了時の最新の統計に従って、クエリを再最適化

### マネージドテーブルと外部テーブルの比較
| 特性                    | Managed                                  | Unmanaged (External)                           |
| ----------------------- | ---------------------------------------- | ---------------------------------------------- |
| TableのTypeプロパティ値 | "MANAGED"                                | "EXTERNAL"                                     |
| DROP Tableの動作        | メタデータを破棄し、関連するデータを削除 | メタデータのみを破棄し、データ本体は削除しない |
| データファイルの場所    | 指定されたマネージドロケーション         | LOCATIONキーワードで指定されたパス             |
| パフォーマンスの最適化  | 自動チューニング (予測的最適化)          | 手動管理                                       |
| データ形式のサポート    | DELTA                                    | DELTA, CSV, JSON, AVRO, PARQUET, ORC           |

### Predictive Optimization
- OPTIMIZE、VACUUM、ANALYZEオペレーションのメリットがあるテーブルを特定し、自動でオペレーションを行う機能
- Liquid Clustering を使用したテーブルに対して、Optimize/Vacuumを自動化
- 管理対象テーブルにデータが書き込まれるときに統計を収集
- すべての操作が[システムテーブル (system.storage.predictive_optimization_operations_history)](https://docs.databricks.com/aws/ja/admin/system-tables/predictive-optimization)にログ記録される

### CLONE
- DEEP CLONE：テーブルのメタデータとデータファイルの両方を完全にコピー
- SHALLOW CLONE：テーブルのメタデータのみをコピーし、データファイル自体はソーステーブルを参照

### データ構造のアクセス
- `:` : JSON文字列のフィールドにアクセス (`schema_of_json()` コマンドでJSON文字列のスキーマを取得)
- `.` : 構造体のフィールドにアクセス (`from_json()` コマンドでJSON文字列を構造体に変換)
- `SELECT json.* FROM (SELECT from_json(json_string) as json)` でJSON文字列のキーを列名、値を各行の要素として展開

### ワークフロー
- Jobs (1つ以上のタスクから構成)
  - ノートブック
  - Pythonスクリプト
  - Python Wheel
  - SQL
  - ダッシュボード
  - DLT
  - dbt
  - JARファイル
  - Sparkサブミット
- フロー
  - 逐次
  - 並列
  - 条件分岐
  - モジュール
- トリガー
  - マニュアル
  - Cron
  - API
  - ファイル到着
  - テーブル更新
  - ストリーミング
- コンピュート
  - 汎用クラスタ
  - ジョブクラスタ
  - サーバレス
- 作成方法
  - UI
  - CLI
  - Terraform
  - API
- Tips
  - クラスタのメモリサイズを大きくしすぎると、GCのコストが増加するので、適切なメモリサイズを選択
  - 適切なメモリが設定されている場合、処理はネットワークバウンドもしくはCPUバウンドになる
  - CPU使用率は常に80%を超えるようにコア数を選択する（目安は8-16）
- パラメータ
  | 質問  | Job Parameters   | Job Contexts | Task Values          |
  | ----- | ------ | ---- | ----- |
  | 説明           | ジョブ内の各タスクに渡されるパラメータ。パラメータのフォーマットや挙動はタスクタイプに依存。 | 特別なテンプレート変数のセットであり、ジョブやタスク実行に関する内向きのメタデータを提供。 | カスタムパラメータ。Databricksジョブ内のタスク間で共有可能。 |
  | 設定方法 | 各タスクのUI上 または Jobs API へのJSON定義で設定            | サポートされている変数はジョブパラメータとして渡す       | Databricks TaskValues サブユーティリティ           |
  | 取得方法 | タスクタイプに依存          | Databricks Widgets API  | Databricks TaskValues サブユーティリティ           |
  | 使用理由     | タスクタイプに依存     | Run IDやジョブの開始時間など、ジョブ実行に関するコンテキストを渡すため       | Databricksジョブ内でタスク間の情報を共有するため             |

### Delta Live Tables と SQL/Python+ジョブ の比較
| 比較項目       | Delta Live Tables        | SQL/Python + ジョブ      |
| --- | ------ | ----- |
| データパイプラインの管理 | 自動管理（スケジューリング、モニタリング）  | 手動で管理が必要   |
| エラー処理と監視      | 自動リトライ、エラーハンドリング、データ品質チェック機能あり | ロジックを個別実装する必要あり   |
| パフォーマンス最適化  | 自動チューニング、キャッシュ管理 | 最適化は手動で設定が必要      |
| パイプライン定義  | 宣言的（何をしたいか（What）を記述）  | 命令的（どのように実行するか（How）を記述）   |
| データ品質管理   | Expectation機能でデータ品質チェック可能     | 自前でバリデーションロジックを実装する必要あり |
| 拡張性  | DLTの機能内でスケール可能     | ジョブの組み合わせで柔軟に対応可能     |
| コスト  | DLTのオートスケールにより高コストになる場合あり | 必要なリソースのみを使用可能でコスト効率的  |
| 運用のシンプルさ      | UIから簡単に管理可能     | ジョブの依存関係管理が必要    |
| 依存関係の管理   | DLT内で定義  | ワークフローで明示的に管理 |

### Databricks Asset Bundles (DAB)
- アーティファクト、ソースコード、構成ファイルなどをまとめて管理
- 開発環境、テスト環境、本番環境など、異なる環境間での一貫性を保ちながらデプロイ可能
- 主なコマンド
  - バンドルの検証：`databricks bundle validate`
  - デプロイ：`databricks bundle deploy`
  - ジョブの実行：`databricks bundle run <job-name>`
- DLTのYAMLは VIEW settings YAML から確認可能
- JobのYAMLは Switch to code version（YAML）から確認可能

### 環境の分割方法
| 比較項目     | ワークスペースごとに分離  | ユニティカタログごとに分離      |
| ----- | --- | --- |
| 環境の完全分離   | 物理的に分かれるため、影響なし  | 同一ワークスペース内のため、誤操作のリスクあり |
| アクセス管理   | ワークスペース単位でIAM制御可能  | 一部設定が共有されるため厳密な管理が必要 |
| コスト | ワークスペースごとにコスト発生  | 1ワークスペース内でコスト効率が良い   |
| データガバナンス | ワークスペースごとで明確に分離  | Unity Catalogの権限で制御可能 |
| CI/CDの簡単さ  | ワークスペース間での移行が必要  | 同一ワークスペース内で簡単に移行可能 |
| 開発の柔軟性   | 環境を跨ぐアクセスが難しい | 環境間のデータアクセスが容易  |
| 運用のシンプルさ | ワークスペース管理が増える | 1ワークスペースで完結し運用負荷が低い  |
| ネットワーク設定 | 環境ごとにVPCなど分離可能  | ネットワークが共有されるため制御が必要 |

### クエリライフサイクル（Unity Catalog Security Model）
- クエリの送信
  - ユーザー（**Principal**）が `SELECT * FROM table1;` を送信
  - Unity Catalogに対応したクラスターまたはSQLウェアハウス）にクエリが届く
- メタデータのチェック
  - クラスタは**Unity Catalog**（メタデータ管理を行う**Control Plane**）に問い合わせを行い、**テーブルのメタデータ、ビュー、SQL関数、アクセスコントロールリスト（ACL）**を確認
- IAMロールの取得
  - Unity Catalog は、適切な**IAMロールまたはサービスプリンシパル**を取得し、アクセス権限を確認
- 一時的な認証情報の発行
  - Unity Catalog は、短期間有効なトークンと署名付きURLを発行
- データ取得リクエスト
  - クエリ実行のため、クラスタは署名付きURLを使用してクラウドストレージにデータをリクエスト
- データ取得
  - クラウドストレージ（Data Plane）からデータが返される
- クラスタポリシーの適用
  - クエリ実行時にクラスタ側で**ポリシーが適用**され、データアクセスが制御される
- クエリ結果の返却
  - ユーザーに最終的なクエリ結果が返される

### Unity Catalog におけるデータアクセスの権限継承モデル
- 権限は、カタログ、スキーマ、テーブルの階層構造に従って継承される
- 明示的な権限付与は、継承された権限を上書き可能
- 権限は、ユーザー、グループ、サービスプリンシパルに対して付与できる

| シナリオ       | 特徴 | メリット  | デメリット  |
| -------- | ------ | ---------------- | ---- |
| 各レベルで明示的に権限付与 | 各オブジェクト（カタログ、スキーマ、テーブル）ごとに個別に権限を設定 | 細かい制御が可能       | 管理が煩雑  |
| スキーマから権限継承 | スキーマ単位で権限を設定し、その配下のテーブル/ビューに継承  | スキーマ内のオブジェクト管理が容易 | スキーマごとに権限設定が必要     |
| カタログから権限継承 | カタログ単位で権限を設定し、すべてのスキーマ/テーブルに継承  | 一括管理が可能で設定がシンプル     | 細かい制御が難しく、全体へのアクセスが広がる |

### アクセス制御
- ワークスペース管理者：ワークスペース内のすべてのオブジェクトに対する CAN MANAGE 権限を持つ
- ユーザー：作成したオブジェクトに対する CAN MANAGE 権限を自動的に持つ

### Access Control Lists (ACLs)
| Privileges   |
| ------------ |
| USE CATALOG  |
| USE SCHEMA   |
| CREATE TABLE |
| SELECT       |
| MODIFY       |
| EXECUTE      |

| Securables              |
| ----------------------- |
| Metastore               |
| External Storage Access |
| Storage Credential      |
| External Location       |
| Catalog                 |
| Schema (Database)       |
| View                    |
| Table                   |
| Function                |
| Volume                  |
| Model                   |
| Query Federation        |
| Foreign Catalog         |
| Connection              |
| Delta Sharing           |
| Share                   |
| Recipient               |
| Provider                |

| Principals        |
| ----------------- |
| User              |
| Service Principal |
| Group             |

### テーブルへの制約付加
- `ALTER TABLE table ADD CONSTRAINT col CHECK condition;`
- `DESCRIBE EXTENDED` で制約の確認可能

### 行ごと・列ごとのアクセス制御
- 行フィルタリングUDF
  ```sql
  CREATE OR REPLACE FUNCTION filter_rows(column_value INT)
  RETURNS BOOLEAN
  RETURN column_value > 10;
  ```

- カラムマスキングUDF
  ```sql
  CREATE OR REPLACE FUNCTION mask_column(column_value STRING)
  RETURNS STRING
  RETURN IF(CURRENT_USER() = 'admin', column_value, '***');
  ```

- テーブルの作成とUDFの適用
  ```sql
  CREATE OR REPLACE TABLE my_table (
      id INT,
      name STRING,
      value INT
  )
  USING DELTA
  LOCATION '/path/to/my_table'
  ROW FILTER filter_rows(value)
  COLUMN MASK name USING mask_column(name);
  ```

- 既存テーブルへのUDFの適用
  ```sql
  ALTER TABLE existing_table
  SET ROW FILTER filter_rows(value)
  ALTER COLUMN name SET MASK USING mask_column(name);
  ```

- UDFの適用状況の確認
  ```sql
  DESCRIBE EXTENDED my_table;
  ```

### Databricks カタログタイプ
| カタログタイプ | データの所在    | メタデータの管理       | ガバナンス適用  | 主な用途  | 代表的なユースケース       |
| ------ | ----- | --- | -- | --- | -- |
| Standard   | Databricks 内部  | Unity Catalog 内で管理 | Databricks の RBAC（ロールベースアクセス制御）適用可  | Databricks 内部のデータ管理 | Databricks で Delta Lake テーブルを管理｜ユーザーアクセス制御や監査を適用      |
| Foreign    | Databricks 外部  | 外部システムで管理、Databricks はメタデータのみ保持 | 一部のガバナンス適用可能（リネージ適用可、データアクセスは外部側のポリシーに依存） | 外部データの参照   | 外部データソースのデータを Databricks から直接クエリ実行｜既存のデータ基盤と統合 |
| Shared     | Databricks の別ワークスペースや外部組織      | Unity Catalog 内で管理 | Unity Catalog の RBAC 適用可（データ所有者が管理）    | データの安全な共有 | 異なる Databricks ワークスペース間でデータ共有 ｜ Delta Sharing による外部パートナーへのデータ提供   |

### Lakehouse Federation
- 統一された権限制御とインテリジェントなプッシュダウン最適化により、すべてのデータへの安全なアクセスを提供する単一のポイントを提供
- データがどこに存在していても、データの検出、クエリ、管理が可能
- 統一された権限制御により、すべてのデータソースに対するアクセス管理を一元化
- インテリジェントなプッシュダウン最適化により、クエリパフォーマンスを向上
- 幅広いデータソースをサポートしており、既存のデータインフラストラクチャとの統合が容易
- 外部データは Catalog Explorer の External data から連携可能
  - カタログ作成時に、Foreign タイプを選択
  - Connection type から使用する外部データの種類を選択

### Marketplace
- Delta Sharingを利用
- データセット、機械学習（ML）モデル、ノートブック、アプリケーション、ダッシュボードなど、さまざまなデータ資産を共有・取得する場を提供
- クラウド、リージョン、プラットフォームを超えたオープンでシームレスな共有

### Delta Sharing
- テーブル、ビュー、ファイル、モデルなどを共有するための機能
- オープンプロトコルを使用して、クロスプラットフォームでデータを共有可能
- レプリケーションなしでデータを共有可能であり、二重管理のリスクを排除でき、ストレージコストを削減可能
- Delta Sharingサーバーによりデータプロバイダーが管理するデータとAI資産へのアクセスを制御
- データコンシューマーは様々なツールやプログラミング言語を使用してデータにアクセス可能

### パフォーマンス
- 推奨事項
  | 領域 | 推奨事項 | 詳細 |
  |------|---------|------|
  | 自動チューニング | Databricksと Delta Lakeの自動チューニングを活用 | ファイルサイズの自動調整、自動最適化による小ファイル問題の回避、AQEによる自動スキュー処理 |
  | データスキッピング | Z-Orderを活用 | カーディナリティの高いカラムでZ-Orderインデックスを作成 |
  | 統計情報の収集 | テーブル統計情報の収集 | 特に結合に使用される列の統計情報を収集 |
  | パーティショニング | 低カーディナリティ列でのデータスキッピング | 年、月、日などの低カーディナリティ列でパーティショニングを使用（1TBを超えるテーブルに対してのみ適用） |
  | CDC アーキテクチャ | SQL DML機能の活用 | 変更データのみを処理するCDCアーキテクチャへの移行 |
  | リソース管理 | ジョブクラスターとSQLウェアハウスの分離 | リソース競合を回避するためにジョブクラスターとSQLウェアハウスを分離 |
  | コード最適化 | 本番ジョブでのアクション操作を回避 | 読み書き以外のアクションをトリガーする操作を避ける（count(), display(), collect()など） |
  | コード最適化 | ドライバーノードへの計算集中を回避 | シングルスレッドのPython/Pandasの代わりにPandas API on Sparkを使用し、関数を分散処理 |
  | コード最適化 | Python UDFの行単位実行を回避 | 行ごとのPython UDFの代わりにネイティブのPySpark関数またはベクトル化されたPandas UDFを使用 |
  | コード最適化 | 最適化されたデータ構造の使用 | RDDの代わりにDataFramesまたはDatasetsを使用し、コストベースのオプティマイザを活用（RDDはコストベースのオプティマイザを活用できない） |

- ボトルネック  
  | 症状     | 詳細               | 対策               |
  | ---------- | -------- | -------- |
  | スキュー   | 処理対象データサイズの不均衡により、一部のノードに負荷が集中     | AQE｜スキューが発生しているファイルのフィルタ |
  | スピル    | メモリ不足による一時ファイルのディスクへの書き込みが発生し、パフォーマンスが低下  | クラスタのコア当たりのRAMを増やす｜スキューを解消しデータサイズの不均衡を抑制｜パーティションサイズの管理｜explode() のような高コストな操作を避ける |
  | シャッフル          | ワイドトランスフォーメーションを行う際に、ワーカーノード間でデータを移動することで、ネットワーク負荷が増大  | 少数のサイズの大きいワーカーを使用し、ネットワークIOを低減する｜NVMeやSSDを使用し、IO速度を高速化する｜不必要な行や列をフィルタリングし、データシャッフルの量を減らす |
  | スモールファイル | 小さなファイルが大量にあると管理のオーバーヘッドが増加し、処理効率が悪化   | Liquid Clustering｜スキューの解消 |
  | シリアライズ  | データやコードの変換・転送時に処理遅延が発生     | 組み込み関数を使う（UDFを使わない）｜（UDFを使う必要がある場合）ベクトル化UDFを使用 |

- SQLウェアハウスのパフォーマンス改善
  - Total wall-clock duration
    - Scheduling
      - Waiting for compute の時間が長い場合
        - サーバレス or 起動済みクラスタを増やす
      - Waiting for queue の時間が長い場合
        - クラスタの最大数を増やす
    - Running
      - Optimization query & pruning files の時間が長い場合
        - 統計情報とファイル最適化が必要
      - Executing の時間が長い場合
        - プランの改善もしくはコンピューティングリソースの追加が必要

- クエリ最適化
  - Unresolved Logical Plan
    - シンタックスや文法のエラーを確認
  - Logical Plan
    - メタデータ（カラムのデータ型など）のカタログやランタイムの統計情報を活用して、論理的に適切なクエリ計画を作成
  - Optimized Logical Plan
    - Catalyst Catalogを活用して計画を最適化
  - Physical Plans
    - クラスタやコンピュート内で行う実際のステージやタスクを計画
  - Selected Physical Plan
    - Cost Based Optimizationにより選択されたPhysical Plansの実行
- 分散データ処理におけるJoin戦略
  - クロスJOINは非常にコストがかかるため、低レイテンシーまたは頻繁な再計算を必要とするワークロードとクエリからクロスJOINは削除
  - 複数のJOINを実行する場合は、必ず最初に最小のテーブルをJOINし、次に大きなテーブルとJOIN
  - 予測的最適化を有効にし、最新の統計を保持
    - 2024年11月11日以降に作成されたすべてのアカウントにてデフォルトで有効
    - ストリーミングテーブルとマテリアライズドビューでは有効化できない

  | Join戦略                | 説明 | 最適な使用シナリオ | 特徴   |
  | ------- | ---------------------------- | -- | ---------------------- |
  | Reordering the join | ジョイン順序を最適化することで実行効率を向上させる手法       | 複数のテーブルを結合する複雑なクエリ   | テーブルサイズや選択率に基づいて最適な順序を決定｜中間結果のサイズを小さくしてメモリ使用量を削減｜クエリオプティマイザが自動で実行することが多い |
  | Dynamically Switching Join Strategies  | 実行時のデータ特性に基づいて最適なジョイン方法（Broadcast / Shuffle / Sort）を動的に選択する手法      | データサイズや分布が予測困難な場合     | 実行時の統計情報に基づいて戦略を選択｜システムリソースに応じて適応｜パフォーマンスの自動最適化      |
  | Broadcast Hash Join | 小さいテーブルを全ノードにブロードキャスト（複製）し、大きいテーブルとハッシュベースで結合 | 一方のテーブルが十分小さく、メモリに収まる場合 | シャッフルのオーバーヘッドを削減｜小テーブル-大テーブルの結合に最適｜ネットワーク転送コストが発生   |
  | Shuffle Hash Joins（Databricks Photonのデフォルト） | ハッシュ化した結合キーに基づいて両方のテーブルのデータをパーティション化し、同じハッシュ値を持つレコードが同じノードに集めて結合 | 大きなテーブル同士の結合      | データを均等に分散｜各ノードでハッシュテーブルを構築｜スケーラビリティが高いがシャッフルコストが発生         |
  | Sort-Merge Join（OS Sparkのデフォルト）     | 両方のテーブルを結合キーでソートし、ソートされたデータをマージするように走査     | メモリが限られた環境での大規模データセット結合 | メモリ効率が良い｜ソートのコストが発生するが結合処理は効率的｜データサイズに対するスケーラビリティが高い     |

### クラスタ最適化のベストプラクティス
- スポットインスタンスをワーカーノードで有効にする
- 可能な限り最新のLTS Databricks Runtimeを使用する
- 適用可能な場合はPhotonを使用し、TCOを最適化する
- 最新世代のVMを使用し、汎用VMから始め、メモリ/計算最適化VMをテストする

### データ変換の種類
- 宣言型
  - 目的の結果をどのように達成するかではなく、望ましい結果に焦点を当てる
  - 可読性が高い
  - メンテナンスコストが低い
- 手続き型
  - 明示的な命令による計算の実行、データを操作するための操作の正確なシーケンスを定義
  - 柔軟性が高く、複雑な処理を実装可能
  - メンテナンスコストが高い

### バッチ処理とストリーミング処理
- マテリアライズドビューは、通常バッチ処理の保証に従うが、可能な場合はDLTを使用して結果を増分的に計算する
- ステートフル集計を使用してデータセット全体の統計を計算することはできず、データセット全体の増分集計計算を行う場合は Materialized View の使用が推奨されている
- ステートフルな構造化ストリーミングクエリの最適化のための推奨事項
  - コンピュート最適化インスタンスをワーカーとして使用
  - シャッフル パーティションの数を、クラスターのコア数の 1 倍から 2 倍に設定
  - spark.sql.streaming.noDataMicroBatches.enabled を false に設定（データを含まないマイクロバッチを処理しないように設定）

#### 結合
- バッチ結合
  - ステートレス
- Stream-Stream 結合
  - ステートフル
  - データソースと結果に関する情報を追跡し、結果を繰り返し更新
  - 結合の両側にウォーターマークを定義する必要がある
  - 状態データを自動的にチェックポイントし、再起動後に同じスキーマとして復元するため、再起動間で以下のようなスキーマを変更してはならない
    - ストリーミング集計でのグループ化キー・集計の数・タイプの変更
    - ストリーミング重複排除でのグループ化キー・集計の数・タイプの変更
    - ストリーム-ストリーム join でのスキーマの変更やジョインの種類 (外部または内部) の変更
    - 
  - サポートされているJOINタイプ
    - Inner join
    - Left outer join
    - Right outer join
    - Full outer join
    - Left semi join
  - コード
    ```python
    import dlt

    dlt.create_streaming_table("adImpressionClicks")
    @dlt.append_flow(target = "adImpressionClicks")
    def joinClicksAndImpressions():
      clicksDf = (read_stream("rawClicks")
        .withWatermark("clickTimestamp", "3 minutes")
      )
      impressionsDf = (read_stream("rawAdImpressions")
        .withWatermark("impressionTimestamp", "3 minutes")
      )
      joinDf = impressionsDf.alias("imp").join(
      clicksDf.alias("click"),
      expr("""
        imp.userId = click.userId AND
        clickAdId = impressionAdId AND
        clickTimestamp >= impressionTimestamp AND
        clickTimestamp <= impressionTimestamp + interval 3 minutes
      """),
      "inner"
      ).select("imp.userId", "impressionAdId", "clickTimestamp", "impressionSeconds")

      return joinDf
    ```
    ```python
    from pyspark.sql import functions as F
    from pyspark.sql.window import Window

    def batch_upsert(microBatchDF, batchId):
        window = Window.partitionBy("order_id", "customer_id").orderBy(F.col("_commit_timestamp").desc())

        (microBatchDF.filter(F.col("_change_type").isin(["insert", "update_postimage"]))
                    .withColumn("rank", F.rank().over(window))
                    .filter("rank = 1")
                    .drop("rank", "_change_type", "_commit_version")
                    .withColumnRenamed("_commit_timestamp", "processed_timestamp")
                    .createOrReplaceTempView("ranked_updates"))

        query = """
            MERGE INTO customers_orders c
            USING ranked_updates r
            ON c.order_id=r.order_id AND c.customer_id=r.customer_id
                WHEN MATCHED AND c.processed_timestamp < r.processed_timestamp
                  THEN UPDATE SET *
                WHEN NOT MATCHED
                  THEN INSERT *
        """

        microBatchDF.sparkSession.sql(query)

    def process_customers_orders():
        orders_df = spark.readStream.table("orders_silver")

        cdf_customers_df = (spark.readStream
                                .option("readChangeData", True)
                                .option("startingVersion", 2)
                                .table("customers_silver")
                          )

        query = (orders_df
                    .join(cdf_customers_df, ["customer_id"], "inner")
                    .writeStream
                        .foreachBatch(batch_upsert)
                        .option("checkpointLocation", "dbfs:/mnt/demo_pro/checkpoints/customers_orders")
                        .trigger(availableNow=True)
                        .start()
                )

        query.awaitTermination()

    process_customers_orders()
    ```
- Stream-Static 結合
  - ステートレス
  - 増分データソース (ファクトテーブルなど) と静的データソース (緩やかに変化するディメンションテーブルなど) を結合するための適切なオプションを提供
  - ストリーミング ソースから新しく受信したレコードのみが現在のバージョンの静的テーブルと結合される
    - ストリームテーブルへのデータ追加のみでトリガーされ、静的テーブルへのデータ追加ではトリガーされない
    - クエリがトリガーされた際は、常に最新の静的テーブルが参照される
  - コード
    ```python
    streamingDF = spark.readStream.table("orders")
    staticDF = spark.read.table("customers")

    query = (streamingDF
      .join(staticDF, streamingDF.customer_id==staticDF.id, "inner")
      .writeStream
      .option("checkpointLocation", checkpoint_path)
      .table("orders_with_customer_info")
    )
    ```
    ```python
    from pyspark.sql import functions as F

    def process_books_sales():

        orders_df = (spark.readStream.table("orders_silver")
                            .withColumn("book", F.explode("books"))
                    )

        books_df = spark.read.table("current_books")

        query = (orders_df
                      .join(books_df, orders_df.book.book_id == books_df.book_id, "inner")
                      .writeStream
                        .outputMode("append")
                        .option("checkpointLocation", "dbfs:/mnt/demo_pro/checkpoints/books_sales")
                        .trigger(availableNow=True)
                        .table("books_sales")
        )

        query.awaitTermination()

    process_books_sales()
    ```

### 構造化ストリーミング
#### トリガータイプ
| トリガータイプ | 構文例 | 説明 |
|--------------|-------|-----|
| Fixed interval micro batches | .trigger(processingTime = "2 minutes") | Micro-batchプロセスをユーザー指定の間隔で実行 |
| Triggered One-time micro batch | .trigger(once=True) | （**Deprecated**）利用可能なすべてのデータを単一のマイクロバッチとして処理し、自動的にクエリを停止する |
| Triggered One-time micro batches | .trigger(availableNow=True) | 利用可能なすべてのデータを複数のマイクロバッチとして処理し、自動的にクエリを停止する |
| Continuous Processing | .trigger(continuous= "2 seconds") | イベントが利用可能になるとすぐにデータの読み取り、処理、書き込みを継続的に行い、指定した頻度でチェックポイントを作成（DLT で適用される連続処理とは全く関係がない） |
| Default | - | Databricks: 500ms固定間隔｜Apache Spark: 前のマイクロバッチが処理され次第、次のマイクロバッチを処理 |

#### アウトプットモード
- ステートレスストリーミングの場合、すべての出力モードは同じように動作（常にそのトリガー中に処理されたレコードを出力）
- ステートフルストリーミングの場合、出力モードごとに異なる動作
| 出力モード | 説明             |
| ---------- | ----------- |
| Append (デフォルト)    | ウォーターマークを考慮の上、将来のトリガーで変更されない行のみを出力 (確定した情報を取得したい場合に有効)       |
| Update   | 出力されたレコードが後続のトリガーで変更される可能性がある場合でも、トリガー中に変更されたすべての行を出力 (集計結果をリアルタイムに追跡したい場合に有効) |
| Complete (ストリーミング集計でのみ機能)  | 生成されたすべての結果の行をダウンストリームに出力 |

#### ウィンドウタイプ
| ウィンドウタイプ | 特徴 | 例 | コード |
|---------------|------|-----|----|
| Tumbling Window (タンブリングウィンドウ) | ウィンドウの重複なし｜任意のイベントは1つだけのウィンドウグループに集計される | 1:00-2:00 am, 2:00-3:00 am, 3:00-4:00 am, ... | `windowed_counts = events.groupBy(window("event_time", "1 hour")).agg(count("*").alias("event_count"))` |
| Sliding Window (スライディングウィンドウ) | ウィンドウが重複する｜任意のイベントは複数のウィンドウグループに集計される | 1:00-2:00 am, 1:30-2:30 am, 2:00-3:00 am, ... | `windowed_counts = events.groupBy(window("event_time", "1 hour", "30 minutes")).agg(count("*").alias("event_count"))` |

#### ウォーターマーク
- 遅延データ（late data）を管理するための時間的しきい値
- 古いステート情報を自動的に削除し、メモリ使用量を最適化
- ウィンドウベースの集計で効果的に機能
- スクリプト
  ```python
  # イベント時間列とウォーターマークの遅延閾値を指定
  streaming_df = streaming_df.withWatermark("eventTime", "10 minutes")

  # ウォーターマーク内に到着した重複レコードの削除
  streaming_df = streaming_df.withWatermark("eventTime", "10 minutes").dropDuplicatesWithinWatermark(["id"])
  ```

#### Slowly Changing Dimension
| 特徴    | SCDタイプ1        | SCDタイプ2 |
| ------- | ----- | --- |
| 変更履歴       | 保持しない        | すべて保持する     |
| データ更新     | 既存レコードを上書き      | 新しいレコードを追加、過去レコードは有効期限付きで保持 |
| 実装    | 比較的簡単        | 複雑       |
- Type-2 SCDの処理コード
  - 処理関数
    ```python
    def type2_upsert(microBatchDF, batch):
        microBatchDF.createOrReplaceTempView("updates")

        sql_query = """
            MERGE INTO books_silver
            USING (
                SELECT updates.book_id as merge_key, updates.*
                FROM updates

                UNION ALL

                SELECT NULL as merge_key, updates.*
                FROM updates
                JOIN books_silver ON updates.book_id = books_silver.book_id
                WHERE books_silver.current = true AND updates.price <> books_silver.price
              ) staged_updates
            ON books_silver.book_id = merge_key
            WHEN MATCHED AND books_silver.current = true AND books_silver.price <> staged_updates.price THEN
              UPDATE SET current = false, end_date = staged_updates.updated
            WHEN NOT MATCHED THEN
            INSERT (book_id, title, author, price, current, effective_date, end_date)
              VALUES (staged_updates.book_id, staged_updates.title, staged_updates.author, staged_updates.price, true, staged_updates.updated, NULL)
        """

        microBatchDF.sparkSession.sql(sql_query)
    ```
  - 処理実行
    ```python
    def process_books():
        schema = "book_id STRING, title STRING, author STRING, price DOUBLE, updated TIMESTAMP"

        query = (spark.readStream
                        .table("bronze")
                        .filter("topic = 'books'")
                        .select(F.from_json(F.col("value").cast("string"), schema).alias("v"))
                        .select("v.*")
                    .writeStream
                        .foreachBatch(type2_upsert)
                        .option("checkpointLocation", "dbfs:/mnt/demo_pro/checkpoints/books_silver")
                        .trigger(availableNow=True)
                        .start()
                )

        query.awaitTermination()

    process_books()
    ```

- DLTでは通常、CDC（Change Data Capture）やインクリメンタル処理を活用して効率的に更新
- Full Refresh Allを指定すると、すべてのデータで再計算を実施
- 構造化ストリーミングクエリの入力レートを制限するため、一貫したバッチ サイズを維持し、大規模なバッチによってスピルや連鎖的なマイクロバッチ処理の遅延が発生するのを防ぐことが可能
  - maxFilesPerTrigger (デフォルト 1000)：各マイクロバッチで処理されるファイル数の上限
  - maxBytesPerTrigger (デフォルト 1000)：各マイクロバッチで処理されるデータ量のおおよその最大値

#### MERGE INTOとAPPLY CHANGES INTOの違い
| 比較項目       | MERGE INTO                                    | APPLY CHANGES INTO               |
| -------------- | --------------------------------------------- | -------------------------------- |
| 用途           | 汎用的なデータ更新・マージ                    | CDC データの適用（**DLT専用**）  |
| 処理対象       | 任意のデータセット                            | 変更データストリーム             |
| 実行環境       | Delta Lake全般                                | **Delta Live Tables（DLT）のみ** |
| 制御性         | 条件ごとに細かく定義可能                      | シンプルな CDC 適用              |
| コードの簡潔さ | やや長くなる                                  | 短く簡単                         |
| カスタマイズ性 | 高い（UPDATE, INSERT, DELETE の条件指定可能） | 低い（基本的にSCD Type 1のみ）   |

#### foreachBatch
- ストリーミングクエリのすべてのマイクロバッチの出力データにバッチ関数を適用
- foreachBatch で使用される関数は、以下 2 つのパラメーターを受け取る
  - マイクロバッチの出力データの DataFrame
  - マイクロバッチの ID
- ストリーミングクエリの出力を複数の場所に書き込む必要がある場合、foreachBatch を使用して複数のシンクに書き込むと、ストリーミング書き込みの実行がシリアル化され、各マイクロバッチの待機時間が長くなる可能性があるため、最適な並列化とスループットのために、複数の構造化ストリーミングライターの使用が推奨される

#### CDCのコード
- Static
  ```python
  customers_df = (spark.table("bronze")
                  .filter("topic = 'customers'")
                  .select(F.from_json(F.col("value").cast("string"), schema).alias("v"))
                  .select("v.*")
                  .filter(F.col("row_status").isin(["insert", "update"])))

  from pyspark.sql.window import Window

  window = Window.partitionBy("customer_id").orderBy(F.col("row_time").desc())

  ranked_df = (customers_df.withColumn("rank", F.rank().over(window))
                            .filter("rank == 1")
                            .drop("rank"))
  ```

- Stream
  - 間違い
    - ストリーミング DataFrame では、時間ベースの順序付けを含んでいるかに関わらず、非集計ウィンドウ関数（F.rank()、F.row_number() など）はサポートされていない
    ```python
    # ストリーミングDataFramesでは非時間ベースのウィンドウ操作はサポートされていないため, 例外が発生する
    ranked_df = (spark.readStream
                      .table("bronze")
                      .filter("topic = 'customers'")
                      .select(F.from_json(F.col("value").cast("string"), schema).alias("v"))
                      .select("v.*")
                      .filter(F.col("row_status").isin(["insert", "update"]))
                      .withColumn("rank", F.rank().over(window))
                      .filter("rank == 1")
                      .drop("rank")
                )
    ```

  - 正解
    ```python
    from pyspark.sql.window import Window

    def batch_upsert(microBatchDF, batchId):
        window = Window.partitionBy("customer_id").orderBy(F.col("row_time").desc())

        (microBatchDF.filter(F.col("row_status").isin(["insert", "update"]))
                    .withColumn("rank", F.rank().over(window))
                    .filter("rank == 1")
                    .drop("rank")
                    .createOrReplaceTempView("ranked_updates"))

        query = """
            MERGE INTO customers_silver c
            USING ranked_updates r
            ON c.customer_id=r.customer_id
                WHEN MATCHED AND c.row_time < r.row_time
                  THEN UPDATE SET *
                WHEN NOT MATCHED
                  THEN INSERT *
        """

    microBatchDF.sparkSession.sql(query)

    query = (spark.readStream
                      .table("bronze")
                      .filter("topic = 'customers'")
                      .select(F.from_json(F.col("value").cast("string"), schema).alias("v"))
                      .select("v.*")
                      .join(F.broadcast(df_country_lookup), F.col("country_code") == F.col("code") , "inner")
                  .writeStream
                      .foreachBatch(batch_upsert)
                      .option("checkpointLocation", "dbfs:/mnt/demo_pro/checkpoints/customers_silver")
                      .trigger(availableNow=True)
                      .start()
              )

    query.awaitTermination()
    ```

- 本番運用を想定した一連の流れ
  ```python
  catalog = "jobs"
  schema = "myschema"
  employees_cdf_table = "employees_cdf"
  employees_table = "employees_merge"

  # チェンジデータフィードをストリームとして読み取る（各マイクロバッチに対して、MERGE INTOコマンドを実行）
  def upsertToDelta(microBatchDF, batchId):
    # マイクロバッチで各キーの最大 sequenceNum を持つ行のすべての列を取得（マイクロバッチ内の同じキーの中で最新の処理を反映）
    microBatchDF = microBatchDF.groupBy("id").agg(
      max_by(struct("*"), "sequenceNum").alias("row")
    ).select("row.*").createOrReplaceTempView("updates")

    # 以下の処理を実行
    # １．新しいデータのタイムスタンプが、格納されているタイムスタンプよりも大きいかどうかを確認し、大きい場合はターゲットからの新しいデータを使用、それ以外の場合は元のデータを保持
    # ２．変更データレコードが削除を示しているときは該当行を削除（実際に削除すると、その後アップサートの行が来た時に対応できないため、削除を記録）
    spark.sql(f"""
      MERGE INTO {catalog}.{schema}.{employees_table} t
      USING updates s
      ON s.id = t.id
      WHEN MATCHED AND s.operation = 'DELETE' THEN UPDATE SET DELETED_AT=now()
      WHEN MATCHED THEN UPDATE SET
        name=CASE WHEN s.sequenceNum > t.sequenceNum THEN s.name ELSE t.name END,
        age=CASE WHEN s.sequenceNum > t.sequenceNum THEN s.age ELSE t.age END,
        country=CASE WHEN s.sequenceNum > t.sequenceNum THEN s.country ELSE t.country END
      WHEN NOT MATCHED THEN INSERT *
    """)

  def create_table():
    spark.sql(f"DROP TABLE IF EXISTS {catalog}.{schema}.{employees_table}")
    spark.sql(f"""
    CREATE TABLE IF NOT EXISTS {catalog}.{schema}.{employees_table}
    (id INT, name STRING, age INT, country STRING)
    """)

  create_table()

  cdcData = spark.readStream.table(f"{catalog}.{schema}.{employees_cdf_table}")

  cdcData.writeStream \
    .foreachBatch(upsertToDelta) \
    .outputMode("append") \
    .start()
  ```
  ```sql
  -- ターゲット テーブルを直接使用できないため、クエリを実行できるビューを作成
  CREATE VIEW employees_v AS
  SELECT * FROM employees_merge
  WHERE DELETED_AT = NULL

  -- 削除が記録された行を定期的に削除するクリーンアップジョブを作成
  DELETE FROM employees_merge
  WHERE DELETED_AT < now() - INTERVAL 1 DAY
  ```

#### その他のコード
- ソースデータの確認
  ```sql
  /* Discover your data in a volume */
  LIST "/Volumes/<catalog>/<schema>/<volume>/<path>/<folder>"

  /* Preview your data in a volume */
  SELECT * FROM read_files("/Volumes/<catalog>/<schema>/<volume>/<path>/<folder>") LIMIT 10

  /* Discover your data in an external location */
  LIST "s3://<bucket>/<path>/<folder>"

  /* Preview your data */
  SELECT * FROM read_files("s3://<bucket>/<path>/<folder>") LIMIT 10
  ```
- 新しいデータのみを取り込む（includeExistingFiles を false に設定し、テーブル作成後にディレクトリに到着したデータのみ処理）
  ```sql
  CREATE OR REFRESH STREAMING TABLE my_bronze_table
  AS SELECT *
  FROM STREAM read_files('s3://mybucket/analysis/*/*/*.json', includeExistingFiles => false)
  ```
- ストリーミング テーブルを完全に更新（データの全履歴を保持しないソースや、保持期間が短いソース ( Kafkaなど) で完全更新を呼び出すことは、既存のデータが切り捨てられるため非推奨）
  ```sql
  REFRESH STREAMING TABLE my_bronze_table FULL
  ```
- ストリーミングレコードの重複排除
  - 次の例では、データは clickTimestamp順に処理され、重複する userId 列と clickAdId 列を含むレコードが 5 秒以内に到着した場合、重複したレコードは削除される
  - コード
    ```python
    clicksDedupDf = (
      spark.readStream.table
        .option("withEventTimeOrder", "true")
        .table("rawClicks")
        .withWatermark("clickTimestamp", "5 seconds")
        .dropDuplicatesWithinWatermark(["userId", "clickAdId"]))
    ```
  - 一連の流れ
    - Stream読込み
      - 読み込んだマイクロバッチごとに重複排除を実行
      ```python
      deduped_df = (spark.readStream
                        .table("bronze")
                        .filter("topic = 'orders'")
                        .select(F.from_json(F.col("value").cast("string"), json_schema).alias("v"))
                        .select("v.*")
                        .withWatermark("order_timestamp", "30 seconds")
                        .dropDuplicates(["order_id", "order_timestamp"]))
      ```
    - マイクロバッチ関数の作成
      - 読み込むマイクロバッチ内での重複削除は、ストリーム読込みで実施済みだが、以前のマイクロバッチで取り込み済みのIDがある可能性があるため、新規IDのデータのみインサート
      ```python
      def upsert_data(microBatchDF, batch):
          microBatchDF.createOrReplaceTempView("orders_microbatch")

          sql_query = """
            MERGE INTO orders_silver a
            USING orders_microbatch b
            ON a.order_id=b.order_id AND a.order_timestamp=b.order_timestamp
            WHEN NOT MATCHED THEN INSERT *
          """

          microBatchDF.sparkSession.sql(sql_query)
          #microBatchDF._jdf.sparkSession().sql(sql_query)
      ```
    - Stream書出し
      - 読み込んだマイクロバッチごとに関数を適用
      ```python
      query = (deduped_df.writeStream
                        .foreachBatch(upsert_data)
                        .option("checkpointLocation", "dbfs:/mnt/demo_pro/checkpoints/orders_silver")
                        .trigger(availableNow=True)
                        .start())

      query.awaitTermination()
      ```

#### Kafkaからデータを取り込むようにストリーミングテーブルを構成
- Bronzeテーブル
  ```python
  import dlt

  @dlt.table
  def kafka_raw():
    return (
      spark.readStream
        .format("kafka")
        .option("kafka.bootstrap.servers", "<server:ip>")
        .option("subscribe", "topic1")
        .option("startingOffsets", "latest")
        .load()
    )
  ```
- Silverテーブル
  ```sql
  CREATE OR REFRESH STREAMING TABLE streaming_silver_table
  AS SELECT
    *
  FROM
    STREAM(kafka_raw)
  WHERE ...
  ```

#### 本番運用の考慮事項
- display や count などの結果を返す不要なコードをノートブックから削除
- 常にジョブコンピュートを使用して、ストリームをジョブとしてスケジュール
- コンピュートの自動スケーリングを有効にしない
- Continuousモードを使用してジョブをスケジュール

#### RocksDBの活用
- チェックポイント管理に RocksDB を使用（各クエリには異なるチェックポイントが必要であり、複数のクエリで同じ場所を共有しない）
- RocksDB ベースの状態管理を有効にするには、SparkSession をストリーミングクエリを開始する前に以下のコマンドを実行
  ```scala
  spark.conf.set(
  "spark.sql.streaming.stateStore.providerClass",
  "com.databricks.sql.streaming.state.RocksDBStateStoreProvider")
  ```
- RocksDB 状態ストアメトリクス
  - ストリーミングデータ処理において、特に RocksDB 状態ストア（各状態演算子（state operator）が管理する、状態管理のために使用されるデータベース）を使用している場合に収集される重要なメトリクス
  - 状態管理の監視、パフォーマンスやリソースの監視と最適化、デバッグとトラブルシューティングなどのために使用される
  - メトリクスの種類
    - インスタンス固有のメトリクス：パーティションID + ストア名 でラベル付けされる特定の状態ストアインスタンスに関連した集計値
    - 集計メトリクス：ジョブ内のすべての状態演算子の動作の合計として集計され、ジョブ全体のパフォーマンス把握に有用
- 変更履歴 (changelog) のチェックポイントを有効化
  - 従来の方式との違い
    - 従来: RocksDB状態ストアのスナップショット全体をチェックポイント処理中に耐久性のあるストレージ（通常はクラウドストレージ）にアップロード
    - 新方式: 最後のチェックポイント以降に変更されたレコードのみを書き込む増分方式
  - メリット
    - チェックポイント処理の期間短縮: 変更されたデータのみを書き込むため処理が高速
    - エンドツーエンドの待機時間削減: ストリーミングクエリのレイテンシが改善
    - ストレージ効率の向上: 変更データのみを保存するため、保存容量が削減]
    - リソース使用量の削減: データ転送量とCPU/メモリ使用量が減少
  - 設定方法
    ```scala
    spark.conf.set("spark.sql.streaming.stateStore.rocksdb.changelogCheckpointing.enabled", "true")
    ```
- 非同期チェックポイント：ジョブの状態情報を非同期で保存（デフォルトの in-memory 状態ストアの実装ではサポート対象外）
  - 状態チェックポイント処理が完了するのを待たずに、前のマイクロバッチの計算が完了するとすぐに、次のマイクロバッチの処理を開始
  - 同期チェックポイントに比べて、レイテンシの短縮が期待できる（状態チェックポイントのレイテンシは、バッチ実行の全体的なレイテンシの主な要因の 1 つ）
  - 設定方法
    ```scala
    spark.conf.set(
      "spark.databricks.streaming.statefulOperator.asyncCheckpoint.enabled",
      "true"
    )

    spark.conf.set(
      "spark.sql.streaming.stateStore.providerClass",
      "com.databricks.sql.streaming.state.RocksDBStateStoreProvider"
    )
    ```
- 非同期プログレス追跡：構造化ストリーミングジョブの進捗状況を非同期で追跡
  - ジョブの進捗を監視し、リアルタイムで進捗情報を収集
  - ストリーミングクエリの進行状況追跡をバックグラウンドで実行することで、メインの処理スレッドへの影響を最小限に抑える
  - 設定方法
    ```scala
    spark.conf.set("spark.sql.streaming.asyncProgressTracking", "true")

    // stream 書出し
    val query = stream.writeStream
      .format("kafka")
      .option("topic", "out")
      .option("checkpointLocation", "/tmp/checkpoint")
      .option("asyncProgressTrackingEnabled", "true")
      .option("asyncProgressTrackingCheckpointIntervalMs", 0)
      .start()
    ```

#### ストリームの監視
- writeStream コードに .queryName(<query-name>) を追加してストリームに一意のクエリ名を付けると、 Spark UI内のどのメトリクスがどのストリームに属しているかを区別しやすくなる
- Apache Spark のストリーミングクエリリスナーインターフェースを使用して、ストリーミングメトリクスを外部サービスにプッシュ可能

#### ストリーミングの制限
- Apache Spark の連続処理モード（.trigger(continuous="X second")）はサポート対象外

#### ストリームソースとしてのビュー
- ストリームできるのは Delta テーブル形式のビューのみ
- Unity Catalog へのビューの登録が必要
- ソース ビューでサポートされている操作は、SELECT, WHERE, UNION ALL のみ

#### ストリーミング開始時点の指定
- startingVersion もしくは startingTimestamp を指定し、ストリームの開始時点を指定可能
- startingVersion が設定されていない場合（推奨）、その時点でのテーブルの完全なスナップショットを含む使用可能な最新バージョンからストリーム開始
- 両方のオプションを同時に設定することはできない

### DLT
#### DLTの特徴
- 外部テーブルへの書き込みや、外部ファイルストレージやデータベーステーブルを操作する条件を組み込む処理はできない
- 制約を満たさないレコードを追加できない従来のデータベースの CHECK 制約とは異なり、期待値はデータ品質要件を満たさないデータを処理するときの柔軟性を提供
- Databricks ワークスペースでは、並列パイプライン更新の上限数は 100 個
- DLT パイプラインから発行されたマテリアライズドビュー とストリーミングテーブル (Databricks SQLによって作成されたものを含む) にアクセスできるのは、 Databricks クライアントとアプリケーションのみ
- タイムトラベルはストリーミングテーブルでのみサポートされ、マテリアライズドビューではサポート対象外
- パイプライン実行には、クラスター作成許可が必要

#### DLTパイプラインの例
- Python
  - @dlt.table デコレーターは、関数によって返された結果に基づいてマテリアライズドビューまたはストリーミングテーブルの作成を DLT に指示
  ```python
  import dlt
  from pyspark.sql.functions import col

  # orders ストリーミングテーブルの作成
  @dlt.table()
  @dlt.expect_or_drop("valid_date", "order_datetime IS NOT NULL AND length(order_datetime) > 0")
  def orders():
    return (spark.readStream
      .format("cloudFiles")
      .option("cloudFiles.format", "json")
      .load("/databricks-datasets/retail-org/sales_orders")
    )

  # customers マテリアライズドビューの作成
  @dlt.table()
  def customers():
      return spark.read.format("csv").option("header", True).load("/databricks-datasets/retail-org/customers")

  # customer_orders マテリアライズドビューの作成
  @dlt.table()
  def customer_orders():
    return (spark.read.table("orders")
      .join(spark.read.table("customers"), "customer_id")
        .select("customer_id",
          "order_number",
          "state",
          col("order_datetime").cast("int").cast("timestamp").cast("date").alias("order_date"),
        )
    )

  # daily_orders_by_state マテリアライズドビューの作成
  @dlt.table()
  def daily_orders_by_state():
      return (spark.read.table("customer_orders")
        .groupBy("state", "order_date")
        .count().withColumnRenamed("count", "order_count")
      )
  ```
- SQL
  ```sql
  -- orders ストリーミングテーブルの作成
  CREATE OR REFRESH STREAMING TABLE orders(
    CONSTRAINT valid_date
    EXPECT (order_datetime IS NOT NULL AND length(order_datetime) > 0)
    ON VIOLATION DROP ROW
  )
  AS SELECT * FROM STREAM read_files("/databricks-datasets/retail-org/sales_orders");

  -- customers マテリアライズドビューの作成
  CREATE OR REFRESH MATERIALIZED VIEW customers
  AS SELECT * FROM read_files("/databricks-datasets/retail-org/customers");

  -- customer_orders マテリアライズドビューの作成
  CREATE OR REFRESH MATERIALIZED VIEW customer_orders
  AS SELECT
    c.customer_id,
    o.order_number,
    c.state,
    date(timestamp(int(o.order_datetime))) order_date
  FROM orders o
  INNER JOIN customers c
  ON o.customer_id = c.customer_id;

  -- daily_orders_by_state マテリアライズドビューの作成
  CREATE OR REFRESH MATERIALIZED VIEW daily_orders_by_state
  AS SELECT state, order_date, count(*) order_count
  FROM customer_orders
  GROUP BY state, order_date;
  ```
- DLT パイプラインで MLflow モデルを使用
  ```python
  %pip install mlflow

  import dlt
  import mlflow
  from pyspark.sql.functions import struct

  run_id = "mlflow_run_id"
  model_name = "the_model_name_in_run"
  model_uri = f"runs:/{run_id}/{model_name}"
  loaded_model_udf = mlflow.pyfunc.spark_udf(spark, model_uri=model_uri)

  @dlt.table
  def model_predictions():
    return spark.read.table(<input-data>)
      .withColumn("prediction", loaded_model_udf(struct(features))))
  ```

#### DLTシンク
- DLT シンクを使用すると、 Apache Kafka や Azure Event Hubs などのイベント ストリーミング サービスや、 Unity Catalog または Hive metastoreによって管理される外部テーブルなどのターゲットに変換されたデータを書き込むことが可能（DLT シンクの機能登場以前は、DLT パイプラインで作成されたストリーミングテーブルとマテリアライズドビューは、 Databricks 管理 Delta テーブルにのみで永続化可能だった）
- 一例として、Apache Kafka トピックなどのメッセージバスからデータを読み取り、データを低レイテンシで処理して、処理されたレコードをメッセージバスに書き戻しが可能となり、クラウドストレージからの書き込みや読み取りを行わないことで、レイテンシーを短縮できる
- シンクへの書き込みに使用できるのは append_flow のみ（apply_changesなどの他のフローはサポート対象外）
- 完全更新を実行しても、シンク内の以前のコンピュート結果データはクリーンアップされない

#### EXPECTの使用法
- フローチャート
- 例
  - Python
    ```python
    # Simple constraint
    @dlt.expect("non_negative_price", "price >= 0")

    # SQL functions
    @dlt.expect("valid_date", "year(transaction_date) >= 2020")

    # CASE statements
    @dlt.expect("valid_order_status", """
      CASE
        WHEN type = 'ORDER' THEN status IN ('PENDING', 'COMPLETED', 'CANCELLED')
        WHEN type = 'REFUND' THEN status IN ('PENDING', 'APPROVED', 'REJECTED')
        ELSE false
      END
    """)

    # Multiple constraints
    @dlt.expect("non_negative_price", "price >= 0")
    @dlt.expect("valid_purchase_date", "date <= current_date()")

    # Complex business logic
    @dlt.expect(
      "valid_subscription_dates",
      """start_date <= end_date
        AND end_date <= current_date()
        AND start_date >= '2020-01-01'"""
    )

    # Complex boolean logic
    @dlt.expect("valid_order_state", """
      (status = 'ACTIVE' AND balance > 0)
      OR (status = 'PENDING' AND created_date > current_date() - INTERVAL 7 DAYS)
    """)

    # 無効なレコードを削除
    @dlt.expect_or_drop("valid_current_page", "current_page_id IS NOT NULL AND current_page_title IS NOT NULL")

    # 無効なレコードで失敗
    @dlt.expect_or_fail("valid_count", "count > 0")

    # 複数の制約（Pythonでのみ使用可）
    valid_pages = {"valid_count": "count > 0", "valid_current_page": "current_page_id IS NOT NULL AND current_page_title IS NOT NULL"}

    @dlt.table
    @dlt.expect_all(valid_pages)
    def raw_data():
      # Create a raw dataset

    @dlt.table
    @dlt.expect_all_or_drop(valid_pages)
    def prepared_data():
      # Create a cleaned and prepared dataset

    @dlt.table
    @dlt.expect_all_or_fail(valid_pages)
    def customer_facing_data():
      # Create cleaned and prepared to share the dataset

    # 行数の検証
    @dlt.view(
      name="count_verification",
      comment="Validates equal row counts between tables"
    )
    @dlt.expect_or_fail("no_rows_dropped", "a_count == b_count")
    def validate_row_counts():
      return spark.sql("""
        SELECT * FROM
          (SELECT COUNT(*) AS a_count FROM table_a),
          (SELECT COUNT(*) AS b_count FROM table_b)""")

    # 範囲ベースの検証パターン
    @dlt.view
    def stats_validation_view():
      # Calculate statistical bounds from historical data
      bounds = spark.sql("""
        SELECT
          avg(amount) - 3 * stddev(amount) as lower_bound,
          avg(amount) + 3 * stddev(amount) as upper_bound
        FROM historical_stats
        WHERE
          date >= CURRENT_DATE() - INTERVAL 30 DAYS
      """)

      # Join with new data and apply bounds
      return spark.read.table("new_data").crossJoin(bounds)

    @dlt.table
    @dlt.expect_or_drop(
      "within_statistical_range",
      "amount BETWEEN lower_bound AND upper_bound"
    )
    def validated_amounts():
      return dlt.read("stats_validation_view")

    # 無効なレコードを隔離
    import dlt
    from pyspark.sql.functions import expr

    rules = {
      "valid_pickup_zip": "(pickup_zip IS NOT NULL)",
      "valid_dropoff_zip": "(dropoff_zip IS NOT NULL)",
    }
    quarantine_rules = "NOT({0})".format(" AND ".join(rules.values()))

    @dlt.view
    def raw_trips_data():
      return spark.readStream.table("samples.nyctaxi.trips")

    @dlt.table(
      temporary=True,
      partition_cols=["is_quarantined"],
    )
    @dlt.expect_all(rules)
    def trips_data_quarantine():
      return (
        dlt.readStream("raw_trips_data").withColumn("is_quarantined", expr(quarantine_rules))
      )

    @dlt.view
    def valid_trips_data():
      return dlt.read("trips_data_quarantine").filter("is_quarantined=false")

    @dlt.view
    def invalid_trips_data():
      return dlt.read("trips_data_quarantine").filter("is_quarantined=true")
    ```
  - SQL
    ```sql
    -- Simple constraint
    CONSTRAINT non_negative_price EXPECT (price >= 0)

    -- SQL functions
    CONSTRAINT valid_date EXPECT (year(transaction_date) >= 2020)

    -- CASE statements
    CONSTRAINT valid_order_status EXPECT (
      CASE
        WHEN type = 'ORDER' THEN status IN ('PENDING', 'COMPLETED', 'CANCELLED')
        WHEN type = 'REFUND' THEN status IN ('PENDING', 'APPROVED', 'REJECTED')
        ELSE false
      END
    )

    -- Multiple constraints
    CONSTRAINT non_negative_price EXPECT (price >= 0)
    CONSTRAINT valid_purchase_date EXPECT (date <= current_date())

    -- Complex business logic
    CONSTRAINT valid_subscription_dates EXPECT (
      start_date <= end_date
      AND end_date <= current_date()
      AND start_date >= '2020-01-01'
    )

    -- Complex boolean logic
    CONSTRAINT valid_order_state EXPECT (
      (status = 'ACTIVE' AND balance > 0)
      OR (status = 'PENDING' AND created_date > current_date() - INTERVAL 7 DAYS)
    )

    -- 無効なレコードを削除
    CONSTRAINT valid_current_page EXPECT (current_page_id IS NOT NULL and current_page_title IS NOT NULL) ON VIOLATION DROP ROW

    -- 無効なレコードで失敗
    CONSTRAINT valid_count EXPECT (count > 0) ON VIOLATION FAIL UPDATE

    -- 行数の検証
    CREATE OR REFRESH MATERIALIZED VIEW count_verification(
      CONSTRAINT no_rows_dropped EXPECT (a_count == b_count)
    ) AS SELECT * FROM
      (SELECT COUNT(*) AS a_count FROM table_a),
      (SELECT COUNT(*) AS b_count FROM table_b)

    -- 範囲ベースの検証パターン
    CREATE OR REFRESH MATERIALIZED VIEW stats_validation_view AS
      WITH bounds AS (
        SELECT
        avg(amount) - 3 * stddev(amount) as lower_bound,
        avg(amount) + 3 * stddev(amount) as upper_bound
        FROM historical_stats
        WHERE date >= CURRENT_DATE() - INTERVAL 30 DAYS
      )
      SELECT
        new_data.*,
        bounds.*
      FROM new_data
      CROSS JOIN bounds;

    CREATE OR REFRESH MATERIALIZED VIEW validated_amounts (
      CONSTRAINT within_statistical_range EXPECT (amount BETWEEN lower_bound AND upper_bound)
    )
    AS SELECT * FROM stats_validation_view;

    -- 無効なレコードを隔離
    CREATE TEMPORARY STREAMING LIVE VIEW raw_trips_data AS
      SELECT * FROM STREAM(samples.nyctaxi.trips);

    CREATE OR REFRESH TEMPORARY STREAMING TABLE trips_data_quarantine(
      -- Option 1 - merge all expectations to have a single name in the pipeline event log
      CONSTRAINT quarantined_row EXPECT (pickup_zip IS NOT NULL OR dropoff_zip IS NOT NULL),
      -- Option 2 - Keep the expectations separate, resulting in multiple entries under different names
      CONSTRAINT invalid_pickup_zip EXPECT (pickup_zip IS NOT NULL),
      CONSTRAINT invalid_dropoff_zip EXPECT (dropoff_zip IS NOT NULL)
    )
    PARTITIONED BY (is_quarantined)
    AS
      SELECT
        *,
        NOT ((pickup_zip IS NOT NULL) and (dropoff_zip IS NOT NULL)) as is_quarantined
      FROM STREAM(raw_trips_data);

    CREATE TEMPORARY LIVE VIEW valid_trips_data AS
    SELECT * FROM trips_data_quarantine WHERE is_quarantined=FALSE;

    CREATE TEMPORARY LIVE VIEW invalid_trips_data AS
    SELECT * FROM trips_data_quarantine WHERE is_quarantined=TRUE;
    ```
- 無効なレコードに対するアクション
  | 操作 | SQL 構文 | Python 構文 | 結果 |
  |------|---------|------------|------|
  | warn (デフォルト) | EXPECT | dlt.expect | 無効なレコードはターゲットに書き込まれ、有効なレコードと無効なレコードの数は、他のデータセットメトリクスとともに記録される |
  | drop | EXPECT ... ON VIOLATION DROP ROW | dlt.expect_or_drop | 無効なレコードは削除され、ドロップされたレコードの数は、他のデータセットメトリクスとともに記録される |
  | fail | EXPECT ... ON VIOLATION FAIL UPDATE | dlt.expect_or_fail | 無効なレコードがある場合、そのフローが失敗し、下流の処理は中断され、途中までの処理はロールバックされる。再処理するためには手動トリガーが必要。失敗したフローと関連のないパイプライン内の他フローに対する影響はない。メトリクスは記録されない。 |

#### PythonでのDLTの記述
- dlt.read() 関数と dlt.read_stream() 関数は使用可能だが、Databricks では常に spark.read.table() 関数と spark.readStream.table() 関数の使用を推奨
  - spark 関数
    - 外部ストレージ内のデータセットや他のパイプラインで定義されたデータセットなど、内部データセットと外部データセットの両方の読み取りをサポート
    - 読み取り操作に対するオプション (skipChangeCommitsなど) の指定をサポート
  - dlt 関数
    - 内部データセットの読み取りのみをサポート
    - オプションの指定は非対応

### Auto Loader
- ファイルが検出されると、そのメタデータはAuto Loaderパイプラインのチェックポイントの場所にあるスケーラブルなキーバリューストア（RocksDB）に永続化され、データが1回だけ処理されることが保証される
- ファイルが追加または上書きされた場合、ファイルのどのバージョンが処理されるかを保証できないため、不変ファイルのみを取り込み、cloudFiles.allowOverwritesの設定を避けることが推奨されている
- データファイルが連続して到着するのではなく、定期的にアップロードされる場合、予想されるファイル到着時刻の後に、Trigger.AvailableNow で実行するようにスケジュールする
- ファイルシステムの監視方法
  - ディレクトリ表示モード
    - 指定されたディレクトリ内に存在する全てのファイルを一度にリストアップして、オートローダーがそれを読み込む
    - リストアップされた全ファイルを一度に読み込むため、ファイル数が多くなると処理が重くなる可能性がある
  - ファイル通知モード
    - システムがファイルの変更（追加、削除、変更など）を監視し、変更があった場合にのみ通知を受けて、オートローダーがそのファイルにアクセス
    - ファイルが変更されると、即座に通知を受けて反応するため、リアルタイムで更新を反映させやすい
    - ディレクトリ全体をスキャンする必要がなく、変更があったファイルだけを監視するため、リソースを節約できる
    - イベント駆動型であるため、システムへの負荷が軽減される

### セキュアな情報管理
#### PIIデータの削除
- ブロンズレイヤーからPIIデータを削除
  - コード
    ```python
    spark.sql("""
    MERGE INTO target
    USING (
      SELECT user_id
      FROM gdpr_control_table
    ) AS source
    ON target.user_id = source.user_id
    WHEN MATCHED THEN DELETE
    """)
    ```
#### Dynamic Views
- 列表示に対する操作
  ```sql
  CREATE OR REPLACE VIEW customers_vw AS
    SELECT
      customer_id,
      CASE
        WHEN is_member('admins_demo') THEN email
        ELSE 'REDACTED'
      END AS email,
      gender
    FROM customers_silver
  ```
- 行表示に対する操作
  ```sql
  CREATE OR REPLACE VIEW customers_fr_vw AS
  SELECT * FROM customers_vw
  WHERE
    CASE
      WHEN is_member('admins_demo') THEN TRUE
      ELSE country = "France" AND row_time > "2022-01-01"
    END
  ```

### ブロンズからシルバー、ゴールドレイヤーへの変更の伝播
  - シルバー、ゴールドレイヤーがマテリアライズドビューの場合
    - ソース（ブロンズ）での削除を自動的に処理
    - Databricks によって自動的に最新の状態に保たれ（サーバレス DLT パイプラインを自動的に作成し更新処理を実施、ベーステーブルでチェンジデータフィードを有効にする必要あり（`ALTER TABLE table1 SET TBLPROPERTIES (delta.enableChangeDataFeed = true);`））、冗長な再計算を回避可能
  - シルバー、ゴールドレイヤーがストリーミングテーブルの場合
    - ストリーミングテーブルは、追加専用データのみを処理するため、データの変更を自分で処理する必要がある
    - 推奨手順：(1) ストリーミングソース内のデータを削除、(2) ストリーミングテーブルから該当データを削除、(3) 読み取ったストリーミングを skipChangeCommits (更新や削除など挿入以外の操作をスキップするフラグ) を使用して更新
    - コード
      ```python
      spark.readStream.option("skipChangeCommits", true).table("source")
      ```
  - シルバー、ゴールドレイヤーがDelta テーブルの場合
    - 削除したことを伝達する独自コードの記述が必要
    - コード
      ```python
      spark.readStream.option("readChangeFeed", true).table("source")
      ```

### ジョブ
- ジョブとタスクでのパラメーターの使用
  - ユースケース
    - コード資産に拡張可能なロジックを追加
    - 実行を条件付け
    - 複数のタスク間で共通のパラメーターを参照
    - あるタスクで生成された情報を別のタスクで使用
    - ジョブ実行でメタデータと状態情報を参照
  - パラメータの種類
    - ジョブパラメータ
    - タスクパラメータ
    - 動的値参照
    - タスク値
- タスク間でコンピュートを共有すると、起動時間に関連するレイテンシーを短縮可能
- dbutils.widget.text(key, value) でジョブのパラメータに指定した値の動的参照が可能
- ジョブのガバナンスとして、ジョブ所有権をサービスプリンシパルに割り当てることが推奨されている。これにより、所有者の離職に対して頑健かつ、権限をサービスプリンシパルで一元管理できるようになる。ワークスペース管理者はジョブの権限を管理し、必要に応じて所有権を再割り当て可能。
- ジョブをAPI実行した場合は、[Run Asのデフォルト](https://docs.databricks.com/aws/en/jobs/privileges#control-access-to-a-job)であるオーナーではなく、APIトークンに対応するユーザーがログに記録される
