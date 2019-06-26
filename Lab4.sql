/*
SELECT statement:
	WHERE
	ORDER BY
	aliasing columns
	special functions
	DISTINCT
	TOP
	JOINS
*/

SELECT * FROM fudgemart_employees

SELECT * FROM fudgemart_employees
WHERE employee_department='Housewares'

SELECT * FROM fudgemart_employees
WHERE employee_department='Housewares'
ORDER BY employee_lastname, employee_firstname

SELECT employee_lastname, employee_firstname, employee_department, employee_birthdate
FROM fudgemart_employees
WHERE employee_department='Housewares'
ORDER BY employee_lastname, employee_firstname

--Column aliasing
SELECT employee_firstname + ' ' + employee_lastname AS employee_name, employee_department, employee_birthdate
FROM fudgemart_employees
WHERE employee_department='Housewares'
ORDER BY employee_lastname, employee_firstname

--Special date functions
SELECT employee_firstname + ' ' + employee_lastname AS employee_name, employee_department, employee_birthdate
FROM fudgemart_employees
WHERE month(employee_birthdate) = 3
ORDER BY employee_lastname, employee_firstname

SELECT employee_firstname + ' ' + employee_lastname AS employee_name, employee_department, employee_birthdate
FROM fudgemart_employees
WHERE month(employee_birthdate) IN (1, 2, 3) --Employees born in Jan, Feb or Mar
ORDER BY employee_lastname, employee_firstname

--TOP
--The idea here is that the TOP occurs AFTER the query has run, and then from the output - it grabs the first top rows.
SELECT TOP 5 employee_firstname + ' ' + employee_lastname AS employee_name, employee_department, employee_hourlywage
FROM fudgemart_employees
ORDER BY employee_hourlywage DESC --Employees that make most - on top

--TOP (percent)
SELECT TOP 20 PERCENT employee_firstname + ' ' + employee_lastname AS employee_name, employee_department, employee_hourlywage
FROM fudgemart_employees
ORDER BY employee_hourlywage DESC

--DISTINCT
SELECT employee_department FROM fudgemart_employees --Every single department for every single employee
SELECT DISTINCT employee_department FROM fudgemart_employees

SELECT employee_department, employee_jobtitle FROM fudgemart_employees
SELECT DISTINCT employee_department, employee_jobtitle FROM fudgemart_employees --Result: one row for each unique combination of employee_department and employee_jobtitle