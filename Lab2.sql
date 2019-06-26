/*
DDL - Data Definition Language:
	CREATE / DROP tables
	Columns, keys and constraints
*/

DROP TABLE product_types;

CREATE TABLE product_types (
	product_type varchar(20) NOT NULL,
	CONSTRAINT pk_product_type PRIMARY KEY(product_type)
);

INSERT INTO product_types(product_type) VALUES ('Book');
INSERT INTO product_types(product_type) VALUES ('Hardware');
INSERT INTO product_types(product_type) VALUES ('Software');

SELECT * FROM product_types;