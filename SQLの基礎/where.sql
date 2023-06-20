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

-- WEHRE句を使って、genderがwomanのレコードを取得
SELECT
 *
FROM
 user_tb
WHERE
 gender = "woman"

-- WHERE句を使って、genderがwomanで、ageが30以上のレコードを取得
SELECT
 *
FROM
 user_tb
WHERE 
 gender = "woman" and age >= 30

-- transaction_tbからsales_amountが2000以上4000以下のtransaction_idとsales_amountを取り出し
SELECT
 transaction_id
 ,sales_amount
FROM
 transaction_tb
WHERE 2000 <= sales_amount
 and 4000 >= sales_amount