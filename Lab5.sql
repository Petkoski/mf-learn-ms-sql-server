/*
Using the JOIN clause in a SELECT statement
*/

SELECT * FROM fudgemart_products

SELECT * FROM fudgemart_vendors


--INNER JOIN:
--SQL-92 Syntax (preferred way because there is CLEAR SEPARATION of the JOIN from the FILTER logic)
SELECT * FROM fudgemart_products JOIN fudgemart_vendors
ON product_vendor_id = vendor_id

SELECT * FROM fudgemart_products JOIN fudgemart_vendors
ON product_vendor_id = vendor_id --(joining condition)
WHERE product_name LIKE 'Dri-Fit Tee' --(regular filter logic)

--SQL-89 Syntax
SELECT * FROM fudgemart_products, fudgemart_vendors
WHERE product_vendor_id = vendor_id

SELECT * FROM fudgemart_products, fudgemart_vendors
WHERE product_vendor_id = vendor_id --(joining condition)
AND product_name LIKE 'Dri-Fit Tee' --(regular filter logic)


--CROSS JOIN (a complete enumeration of all rows in one table with all rows in another, every combination):
SELECT * FROM fudgemart_products CROSS JOIN fudgemart_vendors --SQL-92

SELECT * FROM fudgemart_products, fudgemart_vendors --SQL-89


--OUTER JOINS:
SELECT * FROM fudgemart_products LEFT JOIN fudgemart_vendors --Show all rows of the LEFT table (even the ones that don't have corresponding matches in the right table)
ON product_vendor_id = vendor_id

SELECT * FROM fudgemart_products RIGHT JOIN fudgemart_vendors --Show all rows of the RIGHT table
ON product_vendor_id = vendor_id

SELECT * FROM fudgemart_products FULL JOIN fudgemart_vendors --Show all rows from both tables (left and right)
ON product_vendor_id = vendor_id