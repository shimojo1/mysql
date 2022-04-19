--chap1

--●テーブルからすべての列を取り出そう

--［A］
SELECT
  *
FROM 
quest
;

--［1］
SELECT
  *
FROM 
  books
;

--［2］
SELECT
  *
FROM
  author
;

--［3］
SELECT
  *
FROM
  sales
;

--［4］
select
  * 
from
  books
;

--●テーブルから特定の列を取り出そう

--［A］
SELECT
  name, 
  sex, 
  age
FROM 
  quest
;

--［1］
SELECT
  title
FROM 
  books
;

--［2］
SELECT
  p_name,
  price
FROM
  product
;

--［3］
SELECT 
  l_name, 
  f_name, 
  class
FROM 
  employee
;

--［4］
SELECT
  title,
  publish
FROM
  books
;


--●重複した行をあらかじめ取り除きたい（DISTINCTキーワード）

--［A］
SELECT DISTINCT
  publish 
FROM 
  books
;

--［1］
SELECT DISTINCT
  prefecture
FROM
  quest
;

--［2］
SELECT DISTINCT
  referer
FROM
  access_log
;

--［3］
SELECT DISTINCT 
  l_name, 
  f_name 
FROM 
  usr
;

--［4］
SELECT DISTINCT
  class
FROM
  employee
;


--●条件に合致したレコードだけを取り出したい（WHERE句）

--［A］
SELECT
  name, 
  answer1, 
  answer2
FROM
	quest
WHERE
	sex='女'
;

--［1］
SELECT
  answer1,
  answer2
FROM
  quest
WHERE
  age >= 20
;

--［2］
SELECT
  isbn,
  title,
  publish
FROM
  books
WHERE
  publish IN ('日経BP','翔泳社')
;

--［3］
SELECT
  l_name,
  f_name,
  email
FROM
  usr
WHERE
  prefecture <> '東京都'
;

--［4］
SELECT
  name,
  sex,
  prefecture
FROM
  quest
WHERE
  age BETWEEN 30 AND 39
;

--［5］
SELECT
  name,
  answer1,
  answer2
FROM
  quest
WHERE
  answered >= '2013-01-01'
;

--［6］
SELECT
  user_id,
  isbn
FROM
  rental
WHERE
  returned=0
;

--［7］
SELECT
  answer2
FROM
  quest
WHERE
  answer2 IS NOT NULL
;

--［8］
SELECT
  title,
  publish,
  price
FROM
  books
WHERE
  price < 5000
;


--●あいまい条件に合致したレコードだけを取り出したい

--［A］
SELECT
  title,
  publish,
  publish_date
FROM
  books
WHERE
  title LIKE '%SQL%'
;

--［1］
SELECT
  *
FROM
  author
WHERE
  name LIKE '山田%'
;

--［2］
SELECT
  name
FROM
  quest
WHERE
  name NOT LIKE '%子'
;

--［3］
SELECT
  isbn,
  title,
  price
FROM
  books
WHERE
  title LIKE 'SQL__'
;

--[4]
SELECT
  l_name,
  f_name
FROM
  employee
WHERE
  l_name_kana LIKE 'ア%'
;

--［5］
SELECT
  title
FROM
  books
WHERE
  publish LIKE '%社'
;


--●複数条件に合致したレコードだけを取り出したい（論理演算子）

--［A］
SELECT
  isbn,
  title,
  price
FROM
  books
WHERE
    publish IN ('日経BP','翔泳社')
  AND
    price >= 3000
;

--［1］
SELECT
  *
FROM
  quest
WHERE
    sex='女'
  AND
    age BETWEEN 20 AND 29
;

--［2］
SELECT
  l_name,
  f_name,
  email
FROM
  usr
WHERE
    prefecture='東京都'
  AND
    email LIKE '%@examples.com'
;

--［3］
SELECT
  answer2
FROM
  quest
WHERE
    answer2 IS NOT NULL
  AND
    answer2 <> ''
;

--［4］
SELECT
  *
FROM
  employee
WHERE
    l_name='山田'
  AND
    f_name='奈美'
;

--［5］
SELECT
  isbn,
  title
FROM
  books
WHERE
    (
      publish='秀和システム'
    OR
      publish='日経BP'
    )
  AND
    price < 3000
;


--●特定の列を使って行を並べ替えたい（ORDER BY句）

--［A］
SELECT
  answer1,
  answer2
FROM
  quest
WHERE
    answer2 IS NOT NULL
  AND
    answer2 <> ''
ORDER BY
  answer1 ASC
;

--［1］
SELECT
  title,
  price
FROM
  books
WHERE
  price BETWEEN 2500 AND 3500
ORDER BY
  price ASC
;

--［2］
SELECT
  l_name,
  f_name,
  prefecture
FROM
  usr
WHERE
  prefecture IN ('東京都','千葉県','神奈川県')
ORDER BY
  l_name_kana ASC,
  f_name_kana ASC
;

--［3］
SELECT
  *
FROM 
  rental 
WHERE 
  returned=0 
AND 
  rental_date < '2012-12-01' 
ORDER BY 
  rental_date DESC
;

--［4］
SELECT
  *
FROM
  access_log
WHERE
  access_date BETWEEN '2013-01-01' AND '2013-01-31'
ORDER BY
  referer DESC, ip_address DESC
;


--●特定範囲のレコードのみを取り出したい（LIMIT句）

--［A］
SELECT 
  l_name, 
  f_name, 
  last_update 
FROM 
  employee 
ORDER BY 
  last_update DESC 
LIMIT
  5
;

--［1］
SELECT
  title,
  publish_date
FROM
  books
ORDER BY  
  publish_date DESC
LIMIT
  2,5
;

--［2］
SELECT
  name,
  answer1,
  answer2
FROM
  quest
ORDER BY
  answered DESC  
LIMIT
  0, 10
;

--［3］
SELECT 
  user_id, 
  isbn, 
  rental_date 
FROM 
  rental 
WHERE 
  returned=0 
ORDER BY 
  rental_date ASC 
LIMIT
  5
;

--［4］
SELECT
  page_id,
  referer,
  ip_address
FROM
  access_log
ORDER BY
  access_date DESC
LIMIT
  10
;


--●特定の列を使ってデータをグルーピングしたい（GROUP BY句）

--［A］
SELECT 
  publish, 
  AVG(price)
FROM 
  books 
GROUP BY
  publish
;

--［1］
SELECT
  sex, MAX(age), MIN(age)  
FROM
  quest
GROUP BY
  sex
;

--［2］
SELECT
  prefecture, sex, AVG(answer1)  
FROM
  quest
GROUP BY
  prefecture, sex
;

--［3］
SELECT 
  s_id, 
  SUM(s_value) 
FROM 
  sales 
GROUP BY
  s_id
;

--［4］
SELECT
  publish,
  MAX(price)
FROM
  books
GROUP BY
  publish
;

--［5］
SELECT
  page_id,
  COUNT(*)
FROM
  access_log
GROUP BY
  page_id
;


--●列に別名を指定したい（ASキーワード）

--［A］
SELECT
  title AS 書名, 
  price * 1.05 AS 税込価格
FROM
  books
;

--［1］
SELECT
  p_name AS 商品名,
  price AS 価格
FROM
  product
ORDER BY
  price ASC
;

--［2］
SELECT
  prefecture AS 都道府県名,
  AVG(age) AS 平均年齢
FROM
  quest
GROUP BY
  prefecture
;

--［3］
SELECT 
  prefecture AS 都道府県名, 
  COUNT(*) AS ユーザ数 
FROM 
  usr 
GROUP BY 
  prefecture
;

--［4］
SELECT
  publish AS 出版社,
  AVG(price) AS 価格平均
FROM
  books
GROUP BY
  publish
;

--［5］
SELECT
  prefecture,
  sex,
  AVG(answer1) AS 評価平均
FROM
  quest
GROUP BY
  prefecture,
  sex
;


--●文字列／日付データの加工を行いたい

--［A］
SELECT 
  CONCAT('ISBN',isbn) AS ISBNコード,
  title AS 書名, 
  DATE_FORMAT(publish_date,'%Y年%m月%d日') AS 刊行日
FROM
  books
;

--［1］
SELECT
  prefecture,
  ROUND(AVG(answer1)) AS 評価平均
FROM
  quest
GROUP BY
  prefecture
;

--［2］
SELECT
  isbn AS ISBNコード,
  DATE_FORMAT(rental_date,'%y/%m/%d') AS 貸出日
FROM
  rental
WHERE
  returned=0
ORDER BY
  rental_date ASC
;

--［3］
SELECT 
  CONCAT(l_name,f_name) AS 利用者名, 
  CONCAT(prefecture, city, o_address) AS 住所 
FROM 
  usr 
ORDER BY 
  user_id DESC
;

--［4］
SELECT
  publish,
  FLOOR(AVG(price))
FROM
  books
GROUP BY
  publish
;

--［5］
SELECT
  depart_id,
  class,
  CONCAT(l_name, f_name) AS 氏名
FROM
  employee
ORDER BY
  depart_id DESC,
  class DESC
;


--●グルーピング結果に対して条件を付与したい（HAVING句）

--［A］
SELECT 
  prefecture, 
  AVG(answer1) AS 評価平均
FROM
  quest
GROUP BY
  prefecture
HAVING
  AVG(answer1)<2
;

--［1］
SELECT
  prefecture, AVG(age)
FROM
  quest
GROUP BY
  prefecture
HAVING
  AVG(age) BETWEEN 35 AND 49
;

--［2］
SELECT
  prefecture, MAX(age)
FROM
  quest
WHERE
  sex='男'
GROUP BY
  prefecture
HAVING
  MAX(age)>60
;

--［3］
SELECT
  author_id,
  COUNT(isbn)
FROM
  author_books
GROUP BY
  author_id
HAVING
  COUNT(isbn) >= 3
;

--［4］
SELECT 
  publish, 
  category_id, 
  COUNT(*) 
FROM 
  books 
GROUP BY 
  publish, 
  category_id 
HAVING 
  COUNT(*)<3
;

--［5］
SELECT
  depart_id,
  COUNT(*)
FROM
  employee
WHERE
  sex=2
GROUP BY
  depart_id
HAVING
  COUNT(*)>=3
;

［6］
SELECT
  referer, 
  count(*)
FROM 
  access_log 
WHERE
  access_date >= '2013-01-01'
GROUP BY 
  referer
HAVING
  count(*) < 5
ORDER BY
  count(*) DESC
;


--●条件によって値を変更したい（CASE演算子）

--［A］
SELECT 
  referer,
  count(*) AS カウント数,
  CASE
    WHEN count(*) >= 50 THEN 'A'
    WHEN count(*) >= 10 THEN 'B'
    ELSE 'C'
  END AS ランク
FROM
  access_log
GROUP BY
  referer
;

--［1］
SELECT
  name AS 氏名,
  CASE
    answer1
    WHEN 3 THEN 'ためになった'
    WHEN 2 THEN '普通'
    WHEN 1 THEN '役に立たない'
    ELSE ''
  END AS 評価,
  answer2 AS 感想
FROM
  quest
ORDER BY
  answered DESC
;

--［2］
SELECT
  isbn,
  count(*) AS 貸出数,
  CASE
    WHEN count(*)>=10 THEN '好評'
    WHEN count(*)>= 5 THEN '普通'
    ELSE '不評'
  END AS 評価
FROM
  rental
GROUP BY
  isbn
;

--［3］
SELECT 
  referer,
  count(*) AS カウント数,
  CASE
    WHEN count(*) >= 50 THEN 'A'
    WHEN count(*) >= 10 THEN 'B'
    ELSE 'C'
  END AS ランク
FROM
  access_log
GROUP BY
  referer
HAVING
  count(*)>=3
ORDER BY
  count(*) DESC
;
--［4］
SELECT
  author_id AS 著者ID,
  COUNT(isbn) AS カウント数,
  CASE
    WHEN count(*) >= 4 THEN '多い'
    WHEN count(*) >= 2 THEN '普通'
    ELSE '少ない'
  END AS 評価
FROM
  author_books
GROUP BY
  author_id
;

--［5］
SELECT
  CONCAT(l_name, f_name),
  CASE
    WHEN class IN ('部長','課長') THEN '管理職'
    WHEN class IN ('主任','担当') THEN '総合職'
    ELSE '一般職'
  END AS 役職クラス
FROM
  employee
;

