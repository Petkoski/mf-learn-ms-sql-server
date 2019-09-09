DROP PROCEDURE dbo.p_give_employee_raise_by_name
GO
CREATE PROCEDURE dbo.p_give_employee_raise_by_name
(
	@emplast varchar(50),
	@empfirst varchar(50),
	@raise money
)
AS
BEGIN
	UPDATE fudgemart_employees
		SET employee_hourlywage = employee_hourlywage + @raise
		WHERE employee_lastname=@emplast
			AND employee_firstname=@empfirst
	IF @@ROWCOUNT=1
		SELECT 'The raise occured for employee name: ' + @empfirst + ' ' + @emplast
	ELSE
		SELECT 'The raise did not occur, no employee with name: ' + @empfirst + ' ' + @emplast
END