CREATE TABLE storages
(
  stor_id CHAR(10) NOT NULL,
  stor_address VARCHAR(25) NOT NULL,
  PRIMARY KEY (stor_id)
);

CREATE TABLE supermarkets
(
  sup_id CHAR(15) NOT NULL,
  sup_address VARCHAR(25) NOT NULL,
  sup_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (sup_id)
);

CREATE TABLE vegetables
(
  prod_id CHAR(10) NOT NULL,
  prod_name VARCHAR(15) NOT NULL,
  prod_price_kg FLOAT NOT NULL,
  prod_condition CHAR(10),
  PRIMARY KEY (prod_id)
);

CREATE TABLE deliveries
(
  del_date DATE NOT NULL,
  del_quantity_kg FLOAT NOT NULL,
  stor_id CHAR(10) NOT NULL,
  prod_id CHAR(10) NOT NULL,
  sup_id CHAR(15) NOT NULL,
  PRIMARY KEY (del_date, stor_id, prod_id, sup_id),
  FOREIGN KEY (stor_id) REFERENCES storages(stor_id),
  FOREIGN KEY (prod_id) REFERENCES vegetables(prod_id),
  FOREIGN KEY (sup_id) REFERENCES supermarkets(sup_id)
);

CREATE TABLE storage_vegetables
(
  stor_prod_quantity_kg FLOAT NOT NULL,
  stor_id CHAR(10) NOT NULL,
  prod_id CHAR(10) NOT NULL,
  PRIMARY KEY (stor_id, prod_id),
  FOREIGN KEY (stor_id) REFERENCES storages(stor_id),
  FOREIGN KEY (prod_id) REFERENCES vegetables(prod_id)
);