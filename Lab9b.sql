DROP PROCEDURE dbo.p_give_employee_raise --Dropping any previous procedure with the same name (if exists)
GO
CREATE PROCEDURE dbo.p_give_employee_raise
(
	@empid int,
	@raise money
)
--Takes 2 params as input (@empid & @raise)
AS
BEGIN
	--Procedural statements:
	UPDATE fudgemart_employees
		SET employee_hourlywage = employee_hourlywage + @raise
		WHERE employee_id=@empid
	IF @@ROWCOUNT=1
		SELECT 'The raise occured for employee name: ' +
			(SELECT employee_firstname + ' ' + employee_lastname
				FROM fudgemart_employees
				WHERE employee_id=@empid)
	ELSE
		SELECT 'The raise did not occur, no employee with id=' + 
			CAST(@empid AS varchar(12))
END

--When executed:
--Commands completed successfully.

--Check:
--Object Explorer -> FudgemartPracticingDB -> Programmability -> Stored Procedures -> dbo.p_give_employee_raise