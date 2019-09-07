USE FudgemartPracticingDB

/*
SQL Aggregates (used to group and summarize data):
	- Count, Sum, Avg, Min, Max
	- Group By
	- Having
	- Putting it all together
*/

SELECT * FROM fudgemart_employees

--Part I:
SELECT COUNT(*) FROM fudgemart_employees
SELECT COUNT(*) AS employee_count FROM fudgemart_employees --Column aliasing

SELECT AVG(employee_hourlywage) AS wage_avg FROM fudgemart_employees


--Part II: If you want to see the avg employee wage for each department:
SELECT employee_department, AVG(employee_hourlywage) AS wage_avg 
FROM fudgemart_employees
--Error: Column 'fudgemart_employees.employee_department' is invalid 
--in the select list because it is not contained in either an aggregate 
--function or the GROUP BY clause.

--Why:
--For any column you are trying to select when you have an aggregate,
--if it is not part of the aggregate function - you have to use it in
--the GROUP BY clause.

--Fixing it:
--Output: list of departments and avg. wage for each.
SELECT employee_department, AVG(employee_hourlywage) AS wage_avg 
FROM fudgemart_employees
GROUP BY employee_department

--Ordering:
SELECT employee_department, AVG(employee_hourlywage) AS wage_avg 
FROM fudgemart_employees
GROUP BY employee_department
ORDER BY wage_avg DESC

--Top 1:
SELECT TOP 1 employee_department, AVG(employee_hourlywage) AS wage_avg 
FROM fudgemart_employees
GROUP BY employee_department
ORDER BY wage_avg DESC

--Top 50 percent:
SELECT TOP 50 PERCENT employee_department, AVG(employee_hourlywage) AS wage_avg 
FROM fudgemart_employees
GROUP BY employee_department
ORDER BY wage_avg DESC


--Part III: How many products each vendor supplies:
SELECT * FROM fudgemart_vendors

--Join vendors to products:
SELECT vendor_id, vendor_name, vendor_phone, product_id
	FROM fudgemart_vendors JOIN fudgemart_products
		ON vendor_id = product_vendor_id

--Group them:
SELECT vendor_id, vendor_name, vendor_phone, COUNT(product_id) AS products_count
	FROM fudgemart_vendors JOIN fudgemart_products
		ON vendor_id = product_vendor_id
	GROUP BY vendor_id, vendor_name, vendor_phone


--Part IV: For each employee, calculate total hours worked in year 2006:
SELECT * FROM fudgemart_employee_timesheets
	WHERE year(timesheet_payrolldate)=2006

SELECT timesheet_employee_id, SUM(timesheet_hours) as total_hours
	FROM fudgemart_employee_timesheets
	WHERE year(timesheet_payrolldate)=2006
	GROUP BY timesheet_employee_id

--Append employee name & hourly wage to the output:
SELECT timesheet_employee_id, employee_lastname, employee_firstname, employee_hourlywage, SUM(timesheet_hours) as total_hours
	FROM fudgemart_employee_timesheets JOIN fudgemart_employees
		ON timesheet_employee_id = employee_id
	WHERE year(timesheet_payrolldate)=2006
	GROUP BY timesheet_employee_id, employee_lastname, employee_firstname, employee_hourlywage

--Append total annual wage and order:
SELECT timesheet_employee_id, employee_lastname, employee_firstname, employee_hourlywage, SUM(timesheet_hours) as total_hours, employee_hourlywage * SUM(timesheet_hours) as total_pay
	FROM fudgemart_employee_timesheets JOIN fudgemart_employees
		ON timesheet_employee_id = employee_id
	WHERE year(timesheet_payrolldate)=2006
	GROUP BY timesheet_employee_id, employee_lastname, employee_firstname, employee_hourlywage
	ORDER BY total_pay DESC
--Couldn't use the 'total_hours' alias when calculating the total annual wage (last column)
--because that part of the statement is occurring during the row selection process, so it
--doesn't know about the column aliases. Only the ORDER BY clause knows about them.
--ORDER BY is affected after the row selection.


--Part V: From the previous report, only show employees that have total_hours >= 2000 hours:
--HAVING - Filters the records after the grouping (GROUP BY):
SELECT timesheet_employee_id, employee_lastname, employee_firstname, employee_hourlywage, SUM(timesheet_hours) as total_hours, employee_hourlywage * SUM(timesheet_hours) as total_pay
	FROM fudgemart_employee_timesheets JOIN fudgemart_employees
		ON timesheet_employee_id = employee_id
	WHERE year(timesheet_payrolldate)=2006
	GROUP BY timesheet_employee_id, employee_lastname, employee_firstname, employee_hourlywage
	HAVING SUM(timesheet_hours) >= 2000
	ORDER BY total_pay DESC
--Can't use column aliases with HAVING too (only with ORDER BY).