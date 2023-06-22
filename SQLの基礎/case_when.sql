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

===== CASE WHEN =====
CASE WHEN 
 {条件式} 
THEN 
 {条件式に当てはまる場合の戻り値} 
ELSE 
 {条件式に当てはまらない場合の戻り値} 
END

*/

-- transaction_tbのsales_amountが5000以上か未満かでユーザーを分け、user_segというカラムに格納する
SELECT
 * , CASE WHEN sales_amount >= 5000 THEN "rich" ELSE "poor" END AS user_seg
FROM
 transaction_tb

-- user_tbの年齢カラムを元に20歳未満と20歳以上で大人と子供を判別し、age_segというカラムに格納する
SELECT
 * , CASE WHEN age >= 20 THEN "adult" ELSE "child" END AS age_seg
FROM
 user_tb