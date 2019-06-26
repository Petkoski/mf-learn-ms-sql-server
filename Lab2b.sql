DROP TABLE products;

CREATE TABLE products (
	product_id INT IDENTITY NOT NULL, --We DON'T want to enter number as 'product_id', that's why we use IDENTITY modifier here, system puts data inside (auto increments the int).
	product_name VARCHAR(50) NOT NULL, --NOT NULL constraint
	product_cost DECIMAL(12,2) NOT NULL DEFAULT(0), --DEFAULT constraint
	product_type varchar(20) NOT NULL,
	CONSTRAINT pk_product_id PRIMARY KEY(product_id), --PRIMARY key
	CONSTRAINT u_product_name UNIQUE(product_name), --UNIQUE constraint: inserted product_name must be unique,
	CONSTRAINT ch_product_cost CHECK(product_cost >= 0), --CHECK constraint: product_cost must be positive decimal
	CONSTRAINT fk_product_type FOREIGN KEY(product_type) REFERENCES product_types(product_type) --FOREIGN key
);

INSERT INTO products(product_name, product_cost, product_type) VALUES ('Learn SQL Server 2005', 34.95, 'Book');
INSERT INTO products(product_name, product_cost, product_type) VALUES ('Learn ASP.NET 5', 34.95, 'Book');
INSERT INTO products(product_name, product_cost, product_type) VALUES ('Learn Windows 2008 Server', 44.95, 'Book');

SELECT * FROM products;