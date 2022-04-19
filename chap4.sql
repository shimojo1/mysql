--���e�[�u�����쐬����

--�mA�n
CREATE TABLE 
  quest
  (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    name_kana VARCHAR(255) NOT NULL,
    sex VARCHAR(5) NOT NULL,
    prefecture VARCHAR(10) NOT NULL,
    age INT DEFAULT 0,
    answer1 INT NULL,
    answer2 TEXT NULL,
    answered DATETIME NOT NULL,
    PRIMARY KEY (id)
  )
;

--�m1�n
CREATE TABLE
  author
  (
    author_id CHAR(5) PRIMARY KEY,
    name VARCHAR(30),
    name_kana VARCHAR(100),
    birth DATE
  )
;

--�m2�n
CREATE TABLE
  order_desc
  (
    po_id INT NOT NULL,
    p_id CHAR(10) NOT NULL,
    quantity INT,
    PRIMARY KEY (po_id, p_id)
  )
;

--�m3�n
CREATE TABLE
  sales
  (
    s_id CHAR(7) NOT NULL,
    s_date DATE NOT NULL,
    s_value INT,
    PRIMARY KEY (s_id, s_date)
  )
;

--�m4�n
CREATE TABLE 
  books
  (
    isbn CHAR(17),
    title VARCHAR(255),
    price INT,
    publish VARCHAR(30),
    publish_date DATE,
    category_id CHAR(5),
    PRIMARY KEY (isbn)
  )
;

--�m5�n
CREATE TABLE
  rental
  (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id CHAR(7),
    isbn CHAR(13),
    rental_date DATE,
    returned SMALLINT DEFAULT 0
  )
;


--���V�K�ɃC���f�b�N�X���쐬����iCREATE INDEX���߁j

--�mA�n
CREATE INDEX
  pub_date 
ON 
  books 
  (
    publish, 
    publish_date
  )
;

--�m1�n
CREATE INDEX 
  ind_rental
ON
  rental
  (
    rental_date
  )
;

--�m2�n
CREATE INDEX
  ind_order
ON
  order_main
  (
    order_date, delivery_date
  )
;

--�m3�n
CREATE INDEX
  ind_product
ON
  product
  (
    p_name
  )
;

--�m4�n
CREATE INDEX
  ind_usr
ON
  usr
  (
    prefecture,
    city,
    o_address
  )
;


--�������e�[�u���ɗ�␧�������ǉ�����

--�mA�n
ALTER TABLE
  quest
ADD
  last_update DATETIME
AFTER
  answered
;


--�m1�n
ALTER TABLE
  books
ADD
  pages INT DEFAULT 0 NOT NULL,
ADD
  rating CHAR(1) DEFAULT 'B' NOT NULL
AFTER
  category_id
;

--�m2�n
CREATE TABLE
  sales
  (
    s_id CHAR(5) NOT NULL,
    s_date DATE NOT NULL,
    s_value INT DEFAULT 0
  )
;
ALTER TABLE
  sales
ADD
  PRIMARY KEY (s_id, s_date)
;

--�m3�n
ALTER TABLE
  books
ADD
  sales INT
AFTER
  category_id
;

--�m4�n
ALTER TABLE
  usr
ADD
  sex VARCHAR(5) DEFAULT '�j'
AFTER
  f_name_kana,
ADD
  job VARCHAR(30)
AFTER
  sex
;

--�m5�n
ALTER TABLE
  employee
ADD
  email VARCHAR(255)
AFTER
  depart_id
;


--�������e�[�u����̗�␧�������ύX����

--�mA�n
ALTER TABLE
  usr
MODIFY
  o_address VARCHAR(255) NULL
;

--�m1�n
ALTER TABLE
  books
MODIFY
  publish VARCHAR(100) NULL
;

--�m2�n
ALTER TABLE
  employee
MODIFY
  l_name VARCHAR(50) NOT NULL,
MODIFY
  f_name VARCHAR(50) NOT NULL
;

--�m3�n
ALTER TABLE
  author
MODIFY
  name VARCHAR(100) DEFAULT ''
;

--�m4�n
ALTER TABLE
  access_log
MODIFY
  referer VARCHAR(200) NULL
;
