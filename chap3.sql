--���V�K�̃f�[�^��}������

--�mA�n
INSERT INTO
  usr
VALUES
  (
    'A200507',
    '���',
    '�����Y',
    '�X�Y�L',
    '�g�N�W���E',
    '�Q�n��',
    '�Q�n�s�k��',
    '1-1-1',
    '040-999-9999',
    NULL
  )
;

--�m1�n
INSERT INTO
  books
VALUES
  (
    '4-8833-0000-4',
    'SQL�~�j',
    1000,
    '���oBP',
    '2011-03-22',
    'S2222'
  )
;

--�m2�n
INSERT INTO
  author
VALUES
  (
    'I0001',
    '��c����',
    '�C�_�P���W',
    NULL
  )
;

--�m3�n
INSERT INTO
  depart
VALUES
  (
    'E03',
    '��O�c�ƕ�'
  )
;

--�m4�n
INSERT INTO
  product
VALUES
  (
    'SB00000001',
    '���X�^���v',
    1250
  )
;


--����w��ŐV�K�̃f�[�^��}������iINSERT���߁j

--�mA�n
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
    '�_�c',
    '��',
    '�J���_',
    '�A�C',
    '040-888-8888'
  )
;

--�m1�n
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
    '���X�؎O�Y',
    '�T�T�L�T�u���E',
    '�j',
    '�����s',
    3,
    '�����[�����e�ł��B',
    NOW()
  )
;

--�m2�n
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

--�m3�n
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
    '���c�K�q',
    '�E�`�_�T�`�R',
    '1973-04-10'
  )
;

--�m4�n
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
    '�a�c',
    'J01',
    CURRENT_DATE
  )
;


--���������ʂ𑼂̃e�[�u���ɑ}������iINSERT���߁j

--�mA�n
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

--�m1�n
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
    '��C',
    '�S��',
    '�A�V�X�^���g'
  )
;

--�m2�n
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


--�������f�[�^���X�V����

--�mA�n
UPDATE
  books
SET
  price=price*1.05
;

--�m1�n
UPDATE
  books
SET
  isbn=CONCAT('ISBN',isbn),
  price=price/1.05
;

--�m2�n
UPDATE
  usr
SET
  email=NULL
;

--�m3�n
UPDATE
  product
SET
  price=price*1.1
;

--�m4�n
UPDATE
  books
SET
  isbn=REPLACE(isbn,'ISBN','')
;

--�m5�n
UPDATE
  quest
SET
  sex=REPLACE(sex,'��','')
;

--�m6�n
UPDATE
  employee
SET
  class=
  (
    CASE
      class
        WHEN '����' THEN '���[�_'
        WHEN '�ے�' THEN '�}�l�[�W��'
        ELSE class
    END
  )
;


--������̏����ɍ��v����f�[�^���X�V����iUPDATE���߁j

--�mA�n
UPDATE 
  quest 
SET 
  answer1=3, 
  answer2='', 
  answered=NOW()
WHERE
  id=3
;

--�m1�n
UPDATE
  books
SET
  publish='WINGS�o��'
WHERE
  publish='�R�c�o��'
;

--�m2�n
UPDATE
  employee
SET
  class='��C',
  last_update=CURRENT_DATE
WHERE
  l_name='�R�c' AND f_name='�ޔ�'
;

--�m3�n
UPDATE
  books
SET
  price=price*0.9
WHERE
  publish='���oBP'
;

--�m4�n
UPDATE
  rental
SET
  returned=9
WHERE
    rental_date < '2012-03-31'
  AND
    returned=0
;

--�m5�n
UPDATE
  rental
SET
  rental_date=CURRENT_DATE
WHERE
    user_id='B200405'
  AND
    isbn='4-0010-0000-1'
;


--������₢���킹���ʂɊ�Â��āA�X�V�������s�������i�T�u�N�G���j

--�mA�n
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


--�m1�n
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

--�m2�n
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

�m3�n
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

--�m4�n
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

--�������f�[�^���폜����iDELETE���߁j

--�mA�n
DELETE FROM
  sales
WHERE
  s_date<='2012-11'
;

--�m1�n
DELETE FROM
  rental
WHERE
    rental_date<='2011-12-31'
  AND
    returned=1
;

--�m2�n
DELETE FROM
  access_log
WHERE
    access_date<'2012-06-01'
  OR
    (referer IS NULL OR referer='')
;

--�m3�n
DELETE FROM
  employee
WHERE
    retired=1
  AND
    last_update<='2007-03-31'
;

--�m4�n
DELETE FROM
  books
WHERE
    category_id='Z9999'
  OR
    category_id IS NULL
;


--������₢���킹���ʂɊ�Â��āA�폜�������s�������i�T�u�N�G���j

--�mA�n
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

--�m1�n
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

--�m2�n
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


--�m3�n
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

--�m4�n
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

