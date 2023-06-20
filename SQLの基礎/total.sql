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

・SUM：合計値を計算
・AVG：平均値を計算
・COUNT：レコード数を計算
・MAX：最大値を計算
・MIN：最小値を計算

*/

-- transaction_tbの全てのsales_amountの合計値
SELECT
 SUM(sales_amount)
FROM
 transaction_tb

-- transaction_tbのuser_idが001のユーザーに絞ってsales_amountの合計値を算出
SELECT
 SUM(sales_amount)
FROM
 transaction_tb
WHERE
 user_id = "001"

-- user_tbからgenderがwomanのレコード数を集計
SELECT
 COUNT(user_id)
FROM
 user_tb
WHERE
 gender = "woman"

-- transaction_tbのuser_id別の合計購入金額（sales_amount）を集計
SELECT
 user_id, SUM(sales_amount)
FROM
 transaction_tb
GROUP BY
 user_id
