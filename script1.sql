-- ----------------------------------------------------------
-- Author Juan Pablo Allin Cañas - jpac.647@gmail.com
-- Version: 0.0.0
-- ----------------------------------------------------------

-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS store DEFAULT CHARACTER SET utf8 ;
USE store ;

-- -----------------------------------------------------
-- Table supplier
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS supplier (
  supp_id INT NOT NULL AUTO_INCREMENT,
  supp_name VARCHAR(45) NOT NULL,
  supp_phone VARCHAR(45) NOT NULL,
  PRIMARY KEY (supp_id)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table seller
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS seller (
  seller_id INT NOT NULL AUTO_INCREMENT,
  seller_name VARCHAR(45) NOT NULL,
  create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (seller_id)
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table store
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS store (
  store_id INT NOT NULL AUTO_INCREMENT,
  seller_seller_id INT NOT NULL,
  store_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (store_id),
  INDEX fk_store_seller1_idx (seller_seller_id ASC) VISIBLE,
  CONSTRAINT fk_store_seller1
    FOREIGN KEY (seller_seller_id)
    REFERENCES seller (seller_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS product (
  product_id INT NOT NULL AUTO_INCREMENT,
  supplier_supp_id INT NOT NULL,
  store_store_id INT NOT NULL,
  product_name VARCHAR(45) NOT NULL,
  product_price DOUBLE NOT NULL,
  product_unit INT NOT NULL,
  create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  delete_at TIMESTAMP NULL,
  PRIMARY KEY (product_id),
  INDEX fk_product_supplier_idx (supplier_supp_id ASC) VISIBLE,
  INDEX fk_product_store1_idx (store_store_id ASC) VISIBLE,
  CONSTRAINT fk_product_supplier
    FOREIGN KEY (supplier_supp_id)
    REFERENCES supplier (supp_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_product_store1
    FOREIGN KEY (store_store_id)
    REFERENCES store (store_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table client
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS client (
  client_id INT NOT NULL AUTO_INCREMENT,
  client_doc_type VARCHAR(3) NOT NULL,
  client_doc_number VARCHAR(12) NOT NULL,
  create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  delete_at TIMESTAMP NULL,
  PRIMARY KEY (client_id),
  UNIQUE INDEX client_doc_UNIQUE (client_doc_type ASC, cliente_doc_number ASC) VISIBLE
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table receipt
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS receipt (
  receipt_id INT NOT NULL AUTO_INCREMENT,
  seller_seller_id INT NOT NULL,
  client_client_id INT NOT NULL,
  create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  delete_at TIMESTAMP NULL,
  PRIMARY KEY (receipt_id),
  INDEX fk_receipt_seller1_idx (seller_seller_id ASC) VISIBLE,
  INDEX fk_receipt_client1_idx (client_client_id ASC) VISIBLE,
  CONSTRAINT fk_receipt_seller1
    FOREIGN KEY (seller_seller_id)
    REFERENCES seller (seller_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_receipt_client1
    FOREIGN KEY (client_client_id)
    REFERENCES client (client_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table product_receipt
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS product_receipt (
  product_receipt_id INT NOT NULL AUTO_INCREMENT,
  product_product_id INT NOT NULL,
  receipt_receipt_id INT NOT NULL,
  create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  delete_at TIMESTAMP NULL,
  PRIMARY KEY (product_receipt_id),
  INDEX fk_product_receipt_product1_idx (product_product_id ASC) VISIBLE,
  INDEX fk_product_receipt_receipt1_idx (receipt_receipt_id ASC) VISIBLE,
  CONSTRAINT fk_product_receipt_product1
    FOREIGN KEY (product_product_id)
    REFERENCES product (product_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_product_receipt_receipt1
    FOREIGN KEY (receipt_receipt_id)
    REFERENCES receipt (receipt_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- INSERTING suppliers
-- -----------------------------------------------------

INSERT INTO supplier (supp_name, supp_phone)
VALUES ('Juan Fernando', '2445544');

INSERT INTO supplier (supp_name, supp_phone)
VALUES ('Oscar Arias', '3445522');

INSERT INTO supplier (supp_name, supp_phone)
VALUES ('Erika Alvarez', '4443366');

-- -----------------------------------------------------
-- INSERTING seller
-- -----------------------------------------------------

INSERT INTO seller (seller_name, create_at)
VALUE ('Don John', CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- INSERTING store
-- -----------------------------------------------------

INSERT INTO store (seller_seller_id, store_name)
VALUES (1,'Metropolitano');

-- -----------------------------------------------------
-- INSERTING products from supplier ID: 1
-- -----------------------------------------------------

INSERT INTO product (supplier_supp_id, store_store_id, product_name, product_price, product_unit, create_at)
VALUES (1,1,'Leche',5000,1,CURRENT_TIMESTAMP);

INSERT INTO product (supplier_supp_id, store_store_id, product_name, product_price, product_unit, create_at)
VALUES (1,1,'Quesito',5000,1,CURRENT_TIMESTAMP);

INSERT INTO product (supplier_supp_id, store_store_id, product_name, product_price, product_unit, create_at)
VALUES (1,1,'Mantequilla',5000,1,CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- INSERTING products from supplier ID: 2
-- -----------------------------------------------------

INSERT INTO product (supplier_supp_id, store_store_id, product_name, product_price, product_unit, create_at)
VALUES (2,1,'Carne de cerdo',11000,1,CURRENT_TIMESTAMP);

INSERT INTO product (supplier_supp_id, store_store_id, product_name, product_price, product_unit, create_at)
VALUES (2,1,'Canasta con huevos',14000,1,CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- INSERTING products from supplier ID: 3
-- -----------------------------------------------------

INSERT INTO product (supplier_supp_id, store_store_id, product_name, product_price, product_unit, create_at)
VALUES (3,1,'Coca-Cola 3L',7500,1,CURRENT_TIMESTAMP);

INSERT INTO product (supplier_supp_id, store_store_id, product_name, product_price, product_unit, create_at)
VALUES (3,1,'Soda 1.5L',2700,1,CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- INSERTING clients
-- -----------------------------------------------------

INSERT INTO client (client_doc_type, client_doc_number, create_at)
VALUES ('CC','1000222333', CURRENT_TIMESTAMP);

INSERT INTO client (client_doc_type, client_doc_number, create_at)
VALUES ('CC','4444555666', CURRENT_TIMESTAMP);

INSERT INTO client (client_doc_type, client_doc_number, create_at)
VALUES ('CC','7777888999', CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- INSERTING receipts
-- -----------------------------------------------------

INSERT INTO receipt (seller_seller_id, client_client_id, create_at)
VALUES (1,1, CURRENT_TIMESTAMP);

INSERT INTO receipt (seller_seller_id, client_client_id, create_at)
VALUES (1,2, CURRENT_TIMESTAMP);

INSERT INTO receipt (seller_seller_id, client_client_id, create_at)
VALUES (1,3, CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- INSERTING products receipts
-- -----------------------------------------------------

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (1,1,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (2,1,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (3,1,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (1,2,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (2,2,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (4,2,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (5,3,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (6,3,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (7,3,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (1,3,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (1,3,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (2,3,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (3,3,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (4,2,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (5,2,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (6,2,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (7,1,CURRENT_TIMESTAMP);

INSERT INTO product_receipt (product_product_id, receipt_receipt_id, create_at)
VALUES (6,1,CURRENT_TIMESTAMP);

-- -----------------------------------------------------
-- Soft delete
-- -----------------------------------------------------

UPDATE product_receipt
SET delete_at = NOW()
WHERE product_receipt_id = 13;

UPDATE product_receipt
SET delete_at = NOW()
WHERE product_receipt_id = 6;

-- -----------------------------------------------------
-- Hard delete
-- -----------------------------------------------------
DELETE FROM product_receipt
WHERE product_receipt_id = 9;

DELETE FROM product_receipt
WHERE product_receipt_id = 16;

-- -----------------------------------------------------
-- Update product_name and its supplier
-- -----------------------------------------------------

UPDATE product
SET product_name = 'Pastas', supplier_supp_id = 2
WHERE product_id = 3;

UPDATE product
SET product_name = 'Leche deslactosada', supplier_supp_id = 3
WHERE product_id = 1;

UPDATE product
SET product_name = 'Cerveza', supplier_supp_id = 1
WHERE product_id = 7