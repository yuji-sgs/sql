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

*/

-- transaction_tbのsales_amountの合計値をuser_idごとに昇順で並べる
SELECT
 user_id, SUM(sales_amount) as sum_amt
FROM
 transaction_tb
GROUP BY
 user_id
ORDER BY
 sum_amt

-- transaction_tbのsales_amountの合計値をuser_idごとに降順で並べる
SELECT
 user_id, SUM(sales_amount) as sum_amt
FROM
 transaction_tb
GROUP BY
 user_id
ORDER BY
 sum_amt desc

-- user_tbを年齢の高い順に並び替えて全データを出力
SELECT
 *
FROM
 user_tb
ORDER BY
 age desc