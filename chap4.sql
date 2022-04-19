--●テーブルを作成する

--［A］
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

--［1］
CREATE TABLE
  author
  (
    author_id CHAR(5) PRIMARY KEY,
    name VARCHAR(30),
    name_kana VARCHAR(100),
    birth DATE
  )
;

--［2］
CREATE TABLE
  order_desc
  (
    po_id INT NOT NULL,
    p_id CHAR(10) NOT NULL,
    quantity INT,
    PRIMARY KEY (po_id, p_id)
  )
;

--［3］
CREATE TABLE
  sales
  (
    s_id CHAR(7) NOT NULL,
    s_date DATE NOT NULL,
    s_value INT,
    PRIMARY KEY (s_id, s_date)
  )
;

--［4］
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

--［5］
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


--●新規にインデックスを作成する（CREATE INDEX命令）

--［A］
CREATE INDEX
  pub_date 
ON 
  books 
  (
    publish, 
    publish_date
  )
;

--［1］
CREATE INDEX 
  ind_rental
ON
  rental
  (
    rental_date
  )
;

--［2］
CREATE INDEX
  ind_order
ON
  order_main
  (
    order_date, delivery_date
  )
;

--［3］
CREATE INDEX
  ind_product
ON
  product
  (
    p_name
  )
;

--［4］
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


--●既存テーブルに列や制約条件を追加する

--［A］
ALTER TABLE
  quest
ADD
  last_update DATETIME
AFTER
  answered
;


--［1］
ALTER TABLE
  books
ADD
  pages INT DEFAULT 0 NOT NULL,
ADD
  rating CHAR(1) DEFAULT 'B' NOT NULL
AFTER
  category_id
;

--［2］
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

--［3］
ALTER TABLE
  books
ADD
  sales INT
AFTER
  category_id
;

--［4］
ALTER TABLE
  usr
ADD
  sex VARCHAR(5) DEFAULT '男'
AFTER
  f_name_kana,
ADD
  job VARCHAR(30)
AFTER
  sex
;

--［5］
ALTER TABLE
  employee
ADD
  email VARCHAR(255)
AFTER
  depart_id
;


--●既存テーブル上の列や制約条件を変更する

--［A］
ALTER TABLE
  usr
MODIFY
  o_address VARCHAR(255) NULL
;

--［1］
ALTER TABLE
  books
MODIFY
  publish VARCHAR(100) NULL
;

--［2］
ALTER TABLE
  employee
MODIFY
  l_name VARCHAR(50) NOT NULL,
MODIFY
  f_name VARCHAR(50) NOT NULL
;

--［3］
ALTER TABLE
  author
MODIFY
  name VARCHAR(100) DEFAULT ''
;

--［4］
ALTER TABLE
  access_log
MODIFY
  referer VARCHAR(200) NULL
;
