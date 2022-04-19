--●内部結合で複数テーブルのデータを結合したい

--［A］
SELECT
  e.l_name,
  e.f_name,
  d.depart_name,
  e.class
FROM
  employee AS e
INNER JOIN
  depart AS d
ON
  e.depart_id=d.depart_id
WHERE
  e.retired <> 1
ORDER BY
  e.depart_id ASC,
  e.s_id ASC
;

--［1］
SELECT
  e.l_name, e.f_name, t.r_date, t.work_time
FROM
  employee AS e
INNER JOIN
  time_card AS t
ON
  e.s_id=t.s_id
WHERE
  t.r_date BETWEEN '2012-12-01' AND '2012-12-31'
ORDER BY
  e.s_id ASC,
  t.r_date ASC
;

--［2］
SELECT
  sh.s_name,
  sl.s_value
FROM
  sales AS sl
INNER JOIN
  shop AS sh
ON
  sl.s_id = sh.s_id
WHERE
  sl.s_date='2012-12'
ORDER BY
  sl.s_value DESC
;

--［3］
SELECT
  sh.s_name,
  SUM(sl.s_value)
FROM
  sales AS sl
INNER JOIN
  shop AS sh
ON
  sl.s_id = sh.s_id
WHERE
  sl.s_date BETWEEN '2012-01' AND '2012-12'
GROUP BY
  sh.s_id,
  sh.s_name
ORDER BY
  SUM(sl.s_value) ASC
;

--［4］
SELECT
  u.l_name,
  u.f_name,
  COUNT(r.id)
FROM
  rental AS r
INNER JOIN
  usr AS u
ON
  r.user_id=u.user_id
WHERE
  r.returned=0
GROUP BY
  r.user_id,
  u.l_name,
  u.f_name
HAVING
  COUNT(r.id)>0
ORDER BY
  COUNT(r.id) DESC
;


--●外部結合で複数テーブルのデータを結合したい

--［A］
SELECT
  p.p_name,
  SUM(o.quantity),
  SUM(p.price * o.quantity)
FROM
  order_desc AS o
RIGHT JOIN
  product AS p
ON
  p.p_id = o.p_id
GROUP BY
  p.p_id,
  p.p_name
ORDER BY
  SUM(p.price * o.quantity) DESC
;


--［1］
SELECT
  u.l_name,
  u.f_name,
  COUNT(r.id)
FROM
  rental AS r
RIGHT JOIN
  usr AS u
ON
  r.user_id=u.user_id
GROUP BY
  u.user_id ,u.l_name ,u.f_name
ORDER BY
  COUNT(r.id) DESC
;

--［2］
SELECT
  d.depart_id, 
  d.depart_name
FROM
  depart AS d
LEFT JOIN
  employee AS e
ON
  d.depart_id = e.depart_id
WHERE
  e.depart_id IS NULL
;

--［3］ 
SELECT
  b.title,
  COUNT(r.isbn)
FROM
  books AS b
LEFT JOIN
  rental AS r
ON
  b.isbn = r.isbn
GROUP BY
  b.isbn,
  b.title
ORDER BY
  COUNT(r.isbn) DESC
;

--［4］
SELECT
  e.l_name,
  e.f_name,
  AVG(t.work_time)
FROM
  employee AS e
LEFT JOIN
  time_card AS t
ON
  e.s_id = t.s_id
GROUP BY
  t.s_id,
  e.l_name,
  e.f_name
ORDER BY
  AVG(t.work_time) DESC
;


--●自己結合で同一テーブル内のデータを結合したい

--［A］
SELECT
  cc.c_title,
  cn.c_title
FROM
  contents AS cc
INNER JOIN
  contents AS cn
ON
  cc.next_id = cn.c_id
ORDER BY
  cc.c_id ASC
;

--［1］
SELECT
  cp.c_id AS 前のページ,
  cn.c_id AS 現在のページ
  
FROM
  contents AS cp
INNER JOIN
  contents AS cn
ON
  cp.next_id = cn.c_id
ORDER BY
  cn.c_id ASC
;

--［2］
SELECT
  mc.title AS メニュー名,
  mn.title AS 親メニュー名
FROM
  menu AS mc
INNER JOIN
  menu AS mn
ON
  mc.parent = mn.page_id
ORDER BY
  mc.page_id ASC
;

--［3］
SELECT
  CONCAT(e.l_name ,e.f_name) AS 社員氏名,
  CONCAT(eu.l_name ,eu.f_name) AS 上司氏名
FROM
  employee AS e
LEFT JOIN
  employee AS eu
ON
  e.b_id = eu.s_id
ORDER BY
  e.s_id ASC
;

--［4］
SELECT
  cp.c_id AS 前のページ,
  cn.c_id AS 現在のページ
  
FROM
  contents AS cp
INNER JOIN
  contents AS cn
ON
  cp.next_id = cn.c_id
ORDER BY
  cn.c_id ASC
;

--●3つ以上のテーブルを結合してみよう（結合の応用）
--［A］
SELECT
  b.title,
  a.name,
  b.publish_date
FROM
  (
    books AS b
  INNER JOIN
    author_books AS ab
  ON
    b.isbn = ab.isbn
  )
INNER JOIN
  author AS a
ON
  ab.author_id = a.author_id
WHERE
  b.publish='日経BP'
ORDER BY
  b.publish_date DESC
;

--［1］
SELECT
  d.depart_name AS 所属部署名,
  CONCAT(e.l_name, e.f_name) AS 社員氏名,
  t.work_time AS 勤務時間
FROM
  (
    employee AS e
  INNER JOIN
    depart AS d
  ON
    e.depart_id = d.depart_id
  )
INNER JOIN
  time_card AS t
ON
  e.s_id = t.s_id
WHERE
  e.s_id='DA00001'
AND
  t.r_date BETWEEN '2012-12-01' AND '2012-12-31'
ORDER BY
  t.r_date ASC
;

--［2］
SELECT
  cp.c_title AS 前コンテンツ名,
  cc.c_title AS 現コンテンツ名,
  cn.c_title AS 次コンテンツ名
FROM
  (
    contents AS cp
  INNER JOIN
    contents AS cc
  ON
    cp.next_id = cc.c_id
  )
INNER JOIN
  contents AS cn
ON
  cc.next_id = cn.c_id
ORDER BY
  cc.c_id ASC
;

--［3］
SELECT
  o.order_date AS 発注日,
  o.po_id AS 注文コード,
  CONCAT(u.l_name ,u.f_name) AS 利用者氏名,
  p.p_name AS 商品名,
  p.price AS 商品単価,
  od.quantity AS 購入数
FROM
  (
    (
      order_main AS o
    INNER JOIN
      order_desc AS od
    ON
      o.po_id = od.po_id
    )
  INNER JOIN
    product AS p
  ON
    od.p_id = p.p_id
  )
INNER JOIN
  usr AS u
ON
  o.user_id = u.user_id
WHERE
  o.delivery_date IS NULL
ORDER BY
  o.order_date ASC,
  o.po_id ASC,
  od.p_id ASC
;


--●ある問い合わせ結果に基づいて、検索を行いたい（サブクエリ）

--［A］
SELECT
  s_id, 
  s_name
FROM
  shop
WHERE
  s_id
NOT IN
  (
  SELECT
    s_id
  FROM 
    sales
  WHERE
    s_date='2012-12'
  )
;

--［1］
SELECT
  answer1,
  answer2
FROM
  quest
WHERE
  age >
  (
  SELECT
    AVG(age)
  FROM
    quest
  )
ORDER BY
  answer1 ASC
;

--［2］
SELECT
  depart_id,
  depart_name
FROM
  depart
WHERE
  NOT EXISTS
    (
    SELECT
      *
    FROM
      employee
    WHERE
      employee.depart_id = depart.depart_id
    )
;

--［3］
SELECT
  sh.s_name,
  sl.s_value
FROM
  sales AS sl
INNER JOIN
  shop AS sh
ON
  sl.s_id=sh.s_id
WHERE
  sl.s_date='2012-12'
AND
  sl.s_value <
    (
    SELECT
      AVG(s_value)
    FROM
      sales
WHERE
  s_date='2012-12'
    )
;

--［4］
SELECT
  l_name,
  f_name
FROM
  usr
WHERE
  NOT EXISTS
    (
    SELECT
      *
    FROM
      rental
    WHERE
      rental.user_id=usr.user_id
    )
;

--●複数テーブルから取り出したデータを統合しよう（UNION句）

--［A］
  SELECT
    u.l_name_kana,
    u.f_name_kana
  FROM
    usr AS u
UNION
  SELECT
    e.l_name_kana,
    e.f_name_kana
  FROM
    employee AS e
ORDER BY
  1,2
;

--［1］
  SELECT
    q.name_kana
  FROM
    quest AS q
  WHERE
    q.sex='女'
UNION ALL
  SELECT
    CONCAT(e.l_name_kana, e.f_name_kana)
  FROM
    employee AS e
  WHERE
    e.sex=2
ORDER BY
  1 ASC
;

--［2］EXCEPT演算子は未対応

--［3］
  SELECT
    CONCAT(u.l_name_kana, u.f_name_kana)
  FROM
    usr AS u
  WHERE
    u.prefecture='千葉県'
UNION
  SELECT
    q.name_kana
  FROM
    quest AS q
  WHERE
    q.prefecture='千葉県'
ORDER BY
  1 DESC
;

--［4］
  SELECT
    a.name_kana
  FROM
    author AS a
UNION 
  SELECT
    CONCAT(u.l_name_kana, u.f_name_kana)
  FROM
    usr AS u
ORDER BY
  1 DESC
;

--［5］INTERSECT演算子は未対応
