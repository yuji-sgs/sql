/*

===== user_tb =====
user_id gender age
001 man 19
002 woman 25
003 man 18
004 woman 40
005 woman 62

===== transaction_tb =====
transaction_id user_id sales_amount
001 001 1000
002 001 2000
003 002 2000
004 003 1000
005 002 4000
006 004 8000
007 005 10000
008 001 2000
009 005 6000
010 005 4000


===== INNER JOIN =====
SELECT
 *
FROM
 {テーブル1} AS t1
INNER JOIN {テーブル2} AS t2
 ON t1.{キー値} = t2.{キー値}


===== WITH =====
 WITH {中間テーブル名} AS (
SELECT
  {抽出データ}
FROM
  {テーブル名}
)

===== WITH（複数の中間テーブルを作成したい場合） =====
WITH {中間テーブル名} AS (
SELECT
  {抽出データ}
FROM
  {テーブル名}
)
,
{中間テーブル名} AS (
SELECT
  {抽出データ}
FROM
  {テーブル名}
)

*/

-- JOINを使って2つのテーブルを紐付ける
SELECT
 *
FROM
 transaction_tb AS t1
INNER JOIN user_tb AS t2
 ON t1.user_id = t2.user_id

-- 男性だけに絞られたuser_idでINNER JOINを使って2つのテーブルを紐付ける
WITH temp_tb AS (
SELECT
  *
FROM
  user_tb
WHERE
  gender = "man"
)

SELECT
 *
FROM
 transaction_tb AS t1
INNER JOIN temp_tb AS t2
 ON t1.user_id = t2.user_id


-- user_tbのユーザーIDを絞り込んだ上でtransaction_tbのデータを左側からLEFT JOINする
WITH temp_tb AS (
SELECT
  *
FROM
  user_tb
WHERE
  gender = "man"
)

SELECT
 *
FROM
 transaction_tb AS t1
LEFT JOIN temp_tb AS t2
 ON t1.user_id = t2.user_id


-- transaction_tbのユーザーIDを絞り込んだ上でuser_tbのデータを右側からLEFT JOINする
WITH temp_tb AS (
SELECT
  *
FROM
  transaction_tb
WHERE
  user_id = 1
)

SELECT
 *
FROM
 temp_tb AS t1
LEFT JOIN user_tb AS t2
 ON t1.user_id = t2.user_id


-- 合計購入金額が5000円以上でかつ男性のユーザーのトランザクションデータを出力
WITH user_sales_amount AS (
SELECT
 user_id
 ,SUM(sales_amount) AS sum_sales
FROM
  transaction_tb
GROUP BY
  user_id
)

SELECT
 *
FROM
 transaction_tb
WHERE
 user_id in (
  SELECT
   t1.user_id
  FROM
   user_sales_amount AS t1
  LEFT JOIN user_tb AS t2
   ON t1.user_id = t2.user_id
  WHERE sum_sales >= 5000
      AND gender = "man"
)