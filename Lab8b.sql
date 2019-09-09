CREATE VIEW v_fudgemart_managers
AS
SELECT * FROM fudgemart_employees
	WHERE employee_jobtitle <> 'Sales Associate'

--When executed:
--Commands completed successfully.

--Check:
--Object Explorer -> FudgemartPracticingDB -> Views -> dbo.v_fudgemart_managers

--Important: we can treat this view as a table.