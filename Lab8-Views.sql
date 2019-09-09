USE FudgemartPracticingDB

/*
Creating and using VIEWS
	- CREATE VIEW
	- Querying the view
	- Finding the view INFORMATION_SCHEMA.VIEWS
	- ALTER / DROP VIEW
*/

--Views are a way of taking your tables and abstracting the complexities
--behind the underlying internal data model (simplifying things).


--Part I:
SELECT * FROM fudgemart_employees
WHERE employee_jobtitle <> 'Sales Associate'
--Business rule: anybody who doesn't have a title of 'Sales Associate' is in
--management.

--Idea is to take this particular query logic (business rule) and save it
--as metadata so that other people can build their queries on it. We would use
--view structure.

--{{ Lab8b.sql }}


--Part II: We can treat this view as a table (a level of abstraction):
--View just creates a different way of looking at the underlying table.
SELECT * FROM v_fudgemart_managers

SELECT employee_lastname, employee_firstname, employee_hourlywage
FROM v_fudgemart_managers
WHERE employee_hourlywage > 10


--Part III:
SELECT * FROM INFORMATION_SCHEMA.VIEWS


--Part IV: Altering a view (when creating views, save the SQL script):
--{{ Lab8c.sql }}


--Part V: Dropping a view before creating it:
--{{ Lab8d.sql }}


--Part VI: Does not matter how complicated the SQL statement is (for creating a view):
--{{ Lab8e.sql }}
SELECT * FROM v_employee_wages_2006