USE FudgemartPracticingDB

/*
Querying INFORMATION_SCHEMA to view metadata
	- Table design
	- Columns
	- Keys
	- Constraints
*/

--SQL uses tables to store metadata as data. For example, when creating
--a table, a row is inserted in a special system table (that stores data
--about that metadata).

--List of all tables:
SELECT * FROM INFORMATION_SCHEMA.TABLES

SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME LIKE 'product%' --(like product{and_something})

--Columns:
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME LIKE 'product%'

--Constraints:
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME LIKE 'product%'

--Check constraints:
SELECT * FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS

--Because this is data, you can change the constraint here (with SQL UPDATE
--statement on this particular row and edit the CHECK_CLAUSE), but is not
--recommended. Use SQL DDL for that.
SELECT * FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS
WHERE CONSTRAINT_NAME='ch_product_cost'

--Foreign keys:
SELECT * FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
WHERE CONSTRAINT_NAME='fk_product_type'