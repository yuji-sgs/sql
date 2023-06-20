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

===== SELECT文 =====
SELECT
 取り出したい情報
FROM
 {取り出したいテーブル}
*/

-- ＊を使うと全てのデータを取り出すことが可能
SELECT
 *
FROM
 user_tb

-- 一部のデータ(age)を取り出すことも可能
SELECT
 age
FROM
 user_tb

-- 2つのカラムを取り出したい時は2つのカラムをカンマ区切りで並べてあげる
SELECT
 user_id ,age
FROM
 user_tb

-- transaction_tbからuser_idとsales_amountを取り出し
SELECT
 user_id
 ,sales_amount
FROM
 transaction_tb
