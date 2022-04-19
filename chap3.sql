--●新規のデータを挿入する

--［A］
INSERT INTO
  usr
VALUES
  (
    'A200507',
    '鈴木',
    '徳次郎',
    'スズキ',
    'トクジロウ',
    '群馬県',
    '群馬市北町',
    '1-1-1',
    '040-999-9999',
    NULL
  )
;

--［1］
INSERT INTO
  books
VALUES
  (
    '4-8833-0000-4',
    'SQLミニ',
    1000,
    '日経BP',
    '2011-03-22',
    'S2222'
  )
;

--［2］
INSERT INTO
  author
VALUES
  (
    'I0001',
    '井田健二',
    'イダケンジ',
    NULL
  )
;

--［3］
INSERT INTO
  depart
VALUES
  (
    'E03',
    '第三営業部'
  )
;

--［4］
INSERT INTO
  product
VALUES
  (
    'SB00000001',
    '黒スタンプ',
    1250
  )
;


--●列指定で新規のデータを挿入する（INSERT命令）

--［A］
INSERT INTO
  usr
  (
    user_id,
    l_name,
    f_name,
    l_name_kana,
    f_name_kana,
    tel
  )
VALUES
  (
    'B200506',
    '神田',
    '愛',
    'カンダ',
    'アイ',
    '040-888-8888'
  )
;

--［1］
INSERT INTO
  quest
  (
    name,
    name_kana,
    sex,
    prefecture,
    answer1,
    answer2,
    answered
  )
VALUES
  (
    '佐々木三郎',
    'ササキサブロウ',
    '男',
    '東京都',
    3,
    '興味深い内容です。',
    NOW()
  )
;

--［2］
INSERT INTO
  rental
  (
    user_id,
    isbn,
    rental_date
  )
VALUES
  (
    'B200502',
    '4-0010-0000-0',
    CURRENT_DATE
  )
;

--［3］
INSERT INTO
  author
  (
    author_id,
    name,
    name_kana,
    birth
  )
VALUES
  (
    'U0001',
    '内田幸子',
    'ウチダサチコ',
    '1973-04-10'
  )
;

--［4］
INSERT INTO
  employee
  (
    s_id,
    l_name,
    depart_id,
    last_update
  )
VALUES
  (
    'WA00001',
    '和田',
    'J01',
    CURRENT_DATE
  )
;


--●検索結果を他のテーブルに挿入する（INSERT命令）

--［A］
INSERT INTO
    usr
  (
    user_id,
    l_name,
    f_name,
    email
  )
  SELECT
    s_id,
    l_name,
    f_name,
    'admin@wings.msn.to'
  FROM
    employee
  WHERE
    last_update >= '2012-01-01'
;

--［1］
INSERT INTO
  time_card
  (
    s_id,
    r_date,
    work_time
  )
SELECT
  s_id,
  CURRENT_DATE,
  0
FROM
  employee
WHERE
  class IN
  (
    '主任',
    '担当',
    'アシスタント'
  )
;

--［2］
INSERT INTO
  sales
  (
    s_id,
    s_date,
    s_value
  )
SELECT
  s_id,
  DATE_FORMAT(CURRENT_DATE,'%Y-%m'),
  0
FROM
  shop
;


--●既存データを更新する

--［A］
UPDATE
  books
SET
  price=price*1.05
;

--［1］
UPDATE
  books
SET
  isbn=CONCAT('ISBN',isbn),
  price=price/1.05
;

--［2］
UPDATE
  usr
SET
  email=NULL
;

--［3］
UPDATE
  product
SET
  price=price*1.1
;

--［4］
UPDATE
  books
SET
  isbn=REPLACE(isbn,'ISBN','')
;

--［5］
UPDATE
  quest
SET
  sex=REPLACE(sex,'性','')
;

--［6］
UPDATE
  employee
SET
  class=
  (
    CASE
      class
        WHEN '部長' THEN 'リーダ'
        WHEN '課長' THEN 'マネージャ'
        ELSE class
    END
  )
;


--●特定の条件に合致するデータを更新する（UPDATE命令）

--［A］
UPDATE 
  quest 
SET 
  answer1=3, 
  answer2='', 
  answered=NOW()
WHERE
  id=3
;

--［1］
UPDATE
  books
SET
  publish='WINGS出版'
WHERE
  publish='山田出版'
;

--［2］
UPDATE
  employee
SET
  class='主任',
  last_update=CURRENT_DATE
WHERE
  l_name='山田' AND f_name='奈美'
;

--［3］
UPDATE
  books
SET
  price=price*0.9
WHERE
  publish='日経BP'
;

--［4］
UPDATE
  rental
SET
  returned=9
WHERE
    rental_date < '2012-03-31'
  AND
    returned=0
;

--［5］
UPDATE
  rental
SET
  rental_date=CURRENT_DATE
WHERE
    user_id='B200405'
  AND
    isbn='4-0010-0000-1'
;


--●ある問い合わせ結果に基づいて、更新処理を行いたい（サブクエリ）

--［A］
UPDATE
  books
SET
  category_id='Z9999'
WHERE
  category_id
NOT IN
  (
    SELECT
      category_id
    FROM
      category
  )
;


--［1］
UPDATE
  employee
SET
  depart_id='Z99'
WHERE
  depart_id
NOT IN
  (
    SELECT
      depart_id
    FROM
      depart
  )
;

--［2］
UPDATE
  employee
SET
  depart_id='Z99'
WHERE
  NOT EXISTS
  (
    SELECT
      *
    FROM
      depart
    WHERE
      depart.depart_id=employee.depart_id
  )
;

［3］
UPDATE
  books
SET
    title
  =
    CONCAT(
      title,
      (
        SELECT
          category_name
        FROM
          category
        WHERE
          category.category_id=books.category_id
      )
    )
;

--［4］
UPDATE
  books
SET
  category_id='XXXXX'
WHERE
  isbn
IN
  (
    SELECT
      isbn
    FROM
      rental
    WHERE
      returned=9
  )
;

--●既存データを削除する（DELETE命令）

--［A］
DELETE FROM
  sales
WHERE
  s_date<='2012-11'
;

--［1］
DELETE FROM
  rental
WHERE
    rental_date<='2011-12-31'
  AND
    returned=1
;

--［2］
DELETE FROM
  access_log
WHERE
    access_date<'2012-06-01'
  OR
    (referer IS NULL OR referer='')
;

--［3］
DELETE FROM
  employee
WHERE
    retired=1
  AND
    last_update<='2007-03-31'
;

--［4］
DELETE FROM
  books
WHERE
    category_id='Z9999'
  OR
    category_id IS NULL
;


--●ある問い合わせ結果に基づいて、削除処理を行いたい（サブクエリ）

--［A］
DELETE FROM
  books
WHERE
  isbn
NOT IN
  (
    SELECT
      isbn
    FROM
      rental
    GROUP BY
      isbn
  )
;

--［1］
DELETE FROM
  employee
WHERE
  depart_id
NOT IN
  (
    SELECT
      depart_id
    FROM
      depart
  )
;

--［2］
DELETE FROM
  employee
WHERE
  NOT EXISTS
  (
    SELECT
      depart.depart_id
    FROM
      depart
    WHERE
      depart.depart_id=employee.depart_id
  )
;


--［3］
DELETE FROM
  sales
WHERE
  s_id
NOT IN
  (
    SELECT
      s_id
    FROM
      shop
  )
;

--［4］
DELETE FROM
  books
WHERE
  isbn
IN
  (
    SELECT
      isbn
    FROM
      rental
    WHERE
      returned=9
  )
;

