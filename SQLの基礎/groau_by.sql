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

-- GROUP BY句を使用して、user_tbの男性女性のレコード数を集計
SELECT
 gender, COUNT(*)
FROM
  user_tb
GROUP BY
  gender

-- WHERE句とGROUP BY句を同時に使用して、user_tbの男性女性のレコード数を集計
SELECT
 gender, COUNT(*)
FROM
 user_tb
WHERE 
 age <= 40
GROUP BY
 gender

-- transaction_tbのuser_id別の合計購入金額（sales_amount）を集計
SELECT
	user_id, SUM(sales_amount)
FROM
	transaction_tb
GROUP BY
	user_id