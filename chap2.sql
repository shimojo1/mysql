--�����������ŕ����e�[�u���̃f�[�^������������

--�mA�n
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

--�m1�n
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

--�m2�n
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

--�m3�n
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

--�m4�n
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


--���O�������ŕ����e�[�u���̃f�[�^������������

--�mA�n
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


--�m1�n
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

--�m2�n
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

--�m3�n 
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

--�m4�n
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


--�����Ȍ����œ���e�[�u�����̃f�[�^������������

--�mA�n
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

--�m1�n
SELECT
  cp.c_id AS �O�̃y�[�W,
  cn.c_id AS ���݂̃y�[�W
  
FROM
  contents AS cp
INNER JOIN
  contents AS cn
ON
  cp.next_id = cn.c_id
ORDER BY
  cn.c_id ASC
;

--�m2�n
SELECT
  mc.title AS ���j���[��,
  mn.title AS �e���j���[��
FROM
  menu AS mc
INNER JOIN
  menu AS mn
ON
  mc.parent = mn.page_id
ORDER BY
  mc.page_id ASC
;

--�m3�n
SELECT
  CONCAT(e.l_name ,e.f_name) AS �Ј�����,
  CONCAT(eu.l_name ,eu.f_name) AS ��i����
FROM
  employee AS e
LEFT JOIN
  employee AS eu
ON
  e.b_id = eu.s_id
ORDER BY
  e.s_id ASC
;

--�m4�n
SELECT
  cp.c_id AS �O�̃y�[�W,
  cn.c_id AS ���݂̃y�[�W
  
FROM
  contents AS cp
INNER JOIN
  contents AS cn
ON
  cp.next_id = cn.c_id
ORDER BY
  cn.c_id ASC
;

--��3�ȏ�̃e�[�u�����������Ă݂悤�i�����̉��p�j
--�mA�n
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
  b.publish='���oBP'
ORDER BY
  b.publish_date DESC
;

--�m1�n
SELECT
  d.depart_name AS ����������,
  CONCAT(e.l_name, e.f_name) AS �Ј�����,
  t.work_time AS �Ζ�����
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

--�m2�n
SELECT
  cp.c_title AS �O�R���e���c��,
  cc.c_title AS ���R���e���c��,
  cn.c_title AS ���R���e���c��
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

--�m3�n
SELECT
  o.order_date AS ������,
  o.po_id AS �����R�[�h,
  CONCAT(u.l_name ,u.f_name) AS ���p�Ҏ���,
  p.p_name AS ���i��,
  p.price AS ���i�P��,
  od.quantity AS �w����
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


--������₢���킹���ʂɊ�Â��āA�������s�������i�T�u�N�G���j

--�mA�n
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

--�m1�n
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

--�m2�n
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

--�m3�n
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

--�m4�n
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

--�������e�[�u��������o�����f�[�^�𓝍����悤�iUNION��j

--�mA�n
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

--�m1�n
  SELECT
    q.name_kana
  FROM
    quest AS q
  WHERE
    q.sex='��'
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

--�m2�nEXCEPT���Z�q�͖��Ή�

--�m3�n
  SELECT
    CONCAT(u.l_name_kana, u.f_name_kana)
  FROM
    usr AS u
  WHERE
    u.prefecture='��t��'
UNION
  SELECT
    q.name_kana
  FROM
    quest AS q
  WHERE
    q.prefecture='��t��'
ORDER BY
  1 DESC
;

--�m4�n
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

--�m5�nINTERSECT���Z�q�͖��Ή�
