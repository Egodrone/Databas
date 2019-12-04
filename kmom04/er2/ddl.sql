USE eshop;

-- Customers
-- Products
-- Order
DROP TABLE IF EXISTS customers;
CREATE TABLE customers
(
  id INT PRIMARY KEY NOT NULL, 
  namex CHAR(20) NOT NULL, 
  lastname CHAR(20) NOT NULL, 
  phone INT NOT NULL,
  personal_number INT NOT NULL,
  adress CHAR(100) NOT NULL
-- FOREIGN KEY (Kategori_typ) REFERENCES Kategori(typ)
);

DROP TABLE IF EXISTS orderp;
CREATE TABLE orderp
(
  id INT PRIMARY KEY NOT NULL, 
  date CHAR(40) NOT NULL, 
  pick_list CHAR(100) NOT NULL,
-- From customer id we get the customer
  Customer INT NOT NULL,
  logg CHAR(100) NOT NULL
--  FOREIGN KEY (Kategori_typ) REFERENCES Kategori(typ)
);

DROP TABLE IF EXISTS product;
CREATE TABLE product
(
  id INT PRIMARY KEY NOT NULL, 
  price INT NOT NULL,
  cathegory CHAR(40) NOT NULL,
  description CHAR(40) NOT NULL
);

DROP TABLE IF EXISTS stock;
CREATE TABLE stock
(
  product1 INT NOT NULL,
  product2 INT NOT NULL,
  product3 INT NOT NULL
);

DROP TABLE IF EXISTS invoice;
CREATE TABLE invoice
(
  id INT PRIMARY KEY NOT NULL, 
  totalprice INT NOT NULL,
  prod_desc CHAR(40) NOT NULL
);
