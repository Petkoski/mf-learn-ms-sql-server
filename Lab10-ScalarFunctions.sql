USE FudgemartPracticingDB

/*
Custom scalar-valued functions
	- Why functions?
	- CREATE / ALTER / DROP function
	- Using in table designs
*/


--Part I: Built-in functions:
SELECT GETDATE()
SELECT YEAR(GETDATE())
SELECT LEN('Jovan')


--Part II: Custom scalar-valued functions:
--{{ Lab10b.sql }}


--Part III: Using it in a select statement:
SELECT 
	employee_lastname, 
	employee_firstname, 
	employee_jobtitle, 
	dbo.is_management(employee_id) AS is_manager,
	YEAR(employee_hiredate) AS year_hired
FROM fudgemart_employees


--Part IV: Creating a view out of it (using a function in a view):
--{{ Lab10c.sql }}
SELECT * FROM v_employee_managers


--Part V: Adding a new column to a table based on the function (using a function in a table):
ALTER TABLE dbo.fudgemart_employees
	ADD
		--employee_is_manager BIT not null default(0)
		employee_is_manager AS dbo.is_management(employee_id)

--New column employee_is_manager(Computed, bit, null) appears. It is not
--stored anywhere, but calculated on the fly by the function.

SELECT * FROM fudgemart_employees