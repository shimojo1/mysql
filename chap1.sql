--chap1

--���e�[�u�����炷�ׂĂ̗�����o����

--�mA�n
SELECT
  *
FROM 
quest
;

--�m1�n
SELECT
  *
FROM 
  books
;

--�m2�n
SELECT
  *
FROM
  author
;

--�m3�n
SELECT
  *
FROM
  sales
;

--�m4�n
select
  * 
from
  books
;

--���e�[�u���������̗�����o����

--�mA�n
SELECT
  name, 
  sex, 
  age
FROM 
  quest
;

--�m1�n
SELECT
  title
FROM 
  books
;

--�m2�n
SELECT
  p_name,
  price
FROM
  product
;

--�m3�n
SELECT 
  l_name, 
  f_name, 
  class
FROM 
  employee
;

--�m4�n
SELECT
  title,
  publish
FROM
  books
;


--���d�������s�����炩���ߎ�菜�������iDISTINCT�L�[���[�h�j

--�mA�n
SELECT DISTINCT
  publish 
FROM 
  books
;

--�m1�n
SELECT DISTINCT
  prefecture
FROM
  quest
;

--�m2�n
SELECT DISTINCT
  referer
FROM
  access_log
;

--�m3�n
SELECT DISTINCT 
  l_name, 
  f_name 
FROM 
  usr
;

--�m4�n
SELECT DISTINCT
  class
FROM
  employee
;


--�������ɍ��v�������R�[�h���������o�������iWHERE��j

--�mA�n
SELECT
  name, 
  answer1, 
  answer2
FROM
	quest
WHERE
	sex='��'
;

--�m1�n
SELECT
  answer1,
  answer2
FROM
  quest
WHERE
  age >= 20
;

--�m2�n
SELECT
  isbn,
  title,
  publish
FROM
  books
WHERE
  publish IN ('���oBP','�ĉj��')
;

--�m3�n
SELECT
  l_name,
  f_name,
  email
FROM
  usr
WHERE
  prefecture <> '�����s'
;

--�m4�n
SELECT
  name,
  sex,
  prefecture
FROM
  quest
WHERE
  age BETWEEN 30 AND 39
;

--�m5�n
SELECT
  name,
  answer1,
  answer2
FROM
  quest
WHERE
  answered >= '2013-01-01'
;

--�m6�n
SELECT
  user_id,
  isbn
FROM
  rental
WHERE
  returned=0
;

--�m7�n
SELECT
  answer2
FROM
  quest
WHERE
  answer2 IS NOT NULL
;

--�m8�n
SELECT
  title,
  publish,
  price
FROM
  books
WHERE
  price < 5000
;


--�������܂������ɍ��v�������R�[�h���������o������

--�mA�n
SELECT
  title,
  publish,
  publish_date
FROM
  books
WHERE
  title LIKE '%SQL%'
;

--�m1�n
SELECT
  *
FROM
  author
WHERE
  name LIKE '�R�c%'
;

--�m2�n
SELECT
  name
FROM
  quest
WHERE
  name NOT LIKE '%�q'
;

--�m3�n
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
  l_name_kana LIKE '�A%'
;

--�m5�n
SELECT
  title
FROM
  books
WHERE
  publish LIKE '%��'
;


--�����������ɍ��v�������R�[�h���������o�������i�_�����Z�q�j

--�mA�n
SELECT
  isbn,
  title,
  price
FROM
  books
WHERE
    publish IN ('���oBP','�ĉj��')
  AND
    price >= 3000
;

--�m1�n
SELECT
  *
FROM
  quest
WHERE
    sex='��'
  AND
    age BETWEEN 20 AND 29
;

--�m2�n
SELECT
  l_name,
  f_name,
  email
FROM
  usr
WHERE
    prefecture='�����s'
  AND
    email LIKE '%@examples.com'
;

--�m3�n
SELECT
  answer2
FROM
  quest
WHERE
    answer2 IS NOT NULL
  AND
    answer2 <> ''
;

--�m4�n
SELECT
  *
FROM
  employee
WHERE
    l_name='�R�c'
  AND
    f_name='�ޔ�'
;

--�m5�n
SELECT
  isbn,
  title
FROM
  books
WHERE
    (
      publish='�G�a�V�X�e��'
    OR
      publish='���oBP'
    )
  AND
    price < 3000
;


--������̗���g���čs����בւ������iORDER BY��j

--�mA�n
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

--�m1�n
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

--�m2�n
SELECT
  l_name,
  f_name,
  prefecture
FROM
  usr
WHERE
  prefecture IN ('�����s','��t��','�_�ސ쌧')
ORDER BY
  l_name_kana ASC,
  f_name_kana ASC
;

--�m3�n
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

--�m4�n
SELECT
  *
FROM
  access_log
WHERE
  access_date BETWEEN '2013-01-01' AND '2013-01-31'
ORDER BY
  referer DESC, ip_address DESC
;


--������͈͂̃��R�[�h�݂̂����o�������iLIMIT��j

--�mA�n
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

--�m1�n
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

--�m2�n
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

--�m3�n
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

--�m4�n
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


--������̗���g���ăf�[�^���O���[�s���O�������iGROUP BY��j

--�mA�n
SELECT 
  publish, 
  AVG(price)
FROM 
  books 
GROUP BY
  publish
;

--�m1�n
SELECT
  sex, MAX(age), MIN(age)  
FROM
  quest
GROUP BY
  sex
;

--�m2�n
SELECT
  prefecture, sex, AVG(answer1)  
FROM
  quest
GROUP BY
  prefecture, sex
;

--�m3�n
SELECT 
  s_id, 
  SUM(s_value) 
FROM 
  sales 
GROUP BY
  s_id
;

--�m4�n
SELECT
  publish,
  MAX(price)
FROM
  books
GROUP BY
  publish
;

--�m5�n
SELECT
  page_id,
  COUNT(*)
FROM
  access_log
GROUP BY
  page_id
;


--����ɕʖ����w�肵�����iAS�L�[���[�h�j

--�mA�n
SELECT
  title AS ����, 
  price * 1.05 AS �ō����i
FROM
  books
;

--�m1�n
SELECT
  p_name AS ���i��,
  price AS ���i
FROM
  product
ORDER BY
  price ASC
;

--�m2�n
SELECT
  prefecture AS �s���{����,
  AVG(age) AS ���ϔN��
FROM
  quest
GROUP BY
  prefecture
;

--�m3�n
SELECT 
  prefecture AS �s���{����, 
  COUNT(*) AS ���[�U�� 
FROM 
  usr 
GROUP BY 
  prefecture
;

--�m4�n
SELECT
  publish AS �o�Ŏ�,
  AVG(price) AS ���i����
FROM
  books
GROUP BY
  publish
;

--�m5�n
SELECT
  prefecture,
  sex,
  AVG(answer1) AS �]������
FROM
  quest
GROUP BY
  prefecture,
  sex
;


--��������^���t�f�[�^�̉��H���s������

--�mA�n
SELECT 
  CONCAT('ISBN',isbn) AS ISBN�R�[�h,
  title AS ����, 
  DATE_FORMAT(publish_date,'%Y�N%m��%d��') AS ���s��
FROM
  books
;

--�m1�n
SELECT
  prefecture,
  ROUND(AVG(answer1)) AS �]������
FROM
  quest
GROUP BY
  prefecture
;

--�m2�n
SELECT
  isbn AS ISBN�R�[�h,
  DATE_FORMAT(rental_date,'%y/%m/%d') AS �ݏo��
FROM
  rental
WHERE
  returned=0
ORDER BY
  rental_date ASC
;

--�m3�n
SELECT 
  CONCAT(l_name,f_name) AS ���p�Җ�, 
  CONCAT(prefecture, city, o_address) AS �Z�� 
FROM 
  usr 
ORDER BY 
  user_id DESC
;

--�m4�n
SELECT
  publish,
  FLOOR(AVG(price))
FROM
  books
GROUP BY
  publish
;

--�m5�n
SELECT
  depart_id,
  class,
  CONCAT(l_name, f_name) AS ����
FROM
  employee
ORDER BY
  depart_id DESC,
  class DESC
;


--���O���[�s���O���ʂɑ΂��ď�����t�^�������iHAVING��j

--�mA�n
SELECT 
  prefecture, 
  AVG(answer1) AS �]������
FROM
  quest
GROUP BY
  prefecture
HAVING
  AVG(answer1)<2
;

--�m1�n
SELECT
  prefecture, AVG(age)
FROM
  quest
GROUP BY
  prefecture
HAVING
  AVG(age) BETWEEN 35 AND 49
;

--�m2�n
SELECT
  prefecture, MAX(age)
FROM
  quest
WHERE
  sex='�j'
GROUP BY
  prefecture
HAVING
  MAX(age)>60
;

--�m3�n
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

--�m4�n
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

--�m5�n
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

�m6�n
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


--�������ɂ���Ēl��ύX�������iCASE���Z�q�j

--�mA�n
SELECT 
  referer,
  count(*) AS �J�E���g��,
  CASE
    WHEN count(*) >= 50 THEN 'A'
    WHEN count(*) >= 10 THEN 'B'
    ELSE 'C'
  END AS �����N
FROM
  access_log
GROUP BY
  referer
;

--�m1�n
SELECT
  name AS ����,
  CASE
    answer1
    WHEN 3 THEN '���߂ɂȂ���'
    WHEN 2 THEN '����'
    WHEN 1 THEN '���ɗ����Ȃ�'
    ELSE ''
  END AS �]��,
  answer2 AS ���z
FROM
  quest
ORDER BY
  answered DESC
;

--�m2�n
SELECT
  isbn,
  count(*) AS �ݏo��,
  CASE
    WHEN count(*)>=10 THEN '�D�]'
    WHEN count(*)>= 5 THEN '����'
    ELSE '�s�]'
  END AS �]��
FROM
  rental
GROUP BY
  isbn
;

--�m3�n
SELECT 
  referer,
  count(*) AS �J�E���g��,
  CASE
    WHEN count(*) >= 50 THEN 'A'
    WHEN count(*) >= 10 THEN 'B'
    ELSE 'C'
  END AS �����N
FROM
  access_log
GROUP BY
  referer
HAVING
  count(*)>=3
ORDER BY
  count(*) DESC
;
--�m4�n
SELECT
  author_id AS ����ID,
  COUNT(isbn) AS �J�E���g��,
  CASE
    WHEN count(*) >= 4 THEN '����'
    WHEN count(*) >= 2 THEN '����'
    ELSE '���Ȃ�'
  END AS �]��
FROM
  author_books
GROUP BY
  author_id
;

--�m5�n
SELECT
  CONCAT(l_name, f_name),
  CASE
    WHEN class IN ('����','�ے�') THEN '�Ǘ��E'
    WHEN class IN ('��C','�S��') THEN '�����E'
    ELSE '��ʐE'
  END AS ��E�N���X
FROM
  employee
;

