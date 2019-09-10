DROP VIEW v_employee_managers
GO
CREATE VIEW v_employee_managers
AS
SELECT 
	employee_lastname, 
	employee_firstname, 
	employee_jobtitle, 
	dbo.is_management(employee_id) AS is_manager,
	YEAR(employee_hiredate) AS year_hired
FROM fudgemart_employees
WHERE dbo.is_management(employee_id)=1