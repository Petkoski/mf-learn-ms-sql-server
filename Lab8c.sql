ALTER VIEW v_fudgemart_managers
AS
SELECT * FROM fudgemart_employees
	WHERE employee_jobtitle <> 'Sales Associate'

--Altering a view