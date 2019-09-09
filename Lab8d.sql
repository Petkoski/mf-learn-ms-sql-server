DROP VIEW v_fudgemart_managers
GO
CREATE VIEW v_fudgemart_managers
AS
SELECT * FROM fudgemart_employees
	WHERE employee_jobtitle <> 'Sales Associate'
GO

--Dropping a view before creating it