/*
DML - Data Manipulation Language:
	INSERT
	UPDATE
	DELETE
	SELECT
*/

INSERT INTO products (product_name, product_cost, product_type) VALUES ('MS Office 2007', 399.99, 'Software');
INSERT INTO products (product_name, product_cost, product_type) VALUES ('Laptop Computer', 1699.99, 'Hardware');
INSERT INTO products (product_name, product_cost, product_type) VALUES ('Desktop Computer', 899.99, 'Hardware');
INSERT INTO products (product_name, product_cost, product_type) VALUES ('Windows Server 2008', 199.99, 'Software');
INSERT INTO products (product_name, product_cost, product_type) VALUES ('Mastering SQL Server 2005', 39.99, 'Book');
INSERT INTO products (product_name, product_cost, product_type) VALUES ('Learning Perl', 29.99, 'Book');

SELECT * FROM products

SELECT * FROM products
ORDER BY product_type DESC

SELECT * FROM products
WHERE product_type='Software'
ORDER BY product_name DESC

DELETE FROM products --IMPORTANT: Affects all rows when a filter (WHERE) is not supplied.

DELETE FROM products
WHERE product_name='Laptop Computer'

UPDATE products
SET product_cost=5.99 --IMPORTANT: Affects all rows when a filter (WHERE) is not supplied.

UPDATE products
SET product_cost=0.90*product_cost --Reduces product cost by 10% on all products.

UPDATE products
SET product_name='Dell Laptop Computer'
WHERE product_id=27

--Adding additional columns that aren't really inside, but they are derived from the table.
SELECT product_name, product_cost, 0.9*product_cost AS discount FROM products --If we want to see what 10% discount will look like, but we DON'T WANT to manipulate the actual data.