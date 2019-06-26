SELECT * FROM fudgemart_vendors

SELECT * FROM fudgemart_products

SELECT product_name FROM fudgemart_products

SELECT product_name, vendor_name
FROM fudgemart_products JOIN fudgemart_vendors
ON product_vendor_id = vendor_id --Since they come from separate tables, we need to JOIN them on the primary/foreign key pairs.
ORDER BY vendor_name, product_name