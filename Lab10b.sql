DROP FUNCTION dbo.is_management --Dropping any previous function with the same name (if exists)
GO 
CREATE FUNCTION dbo.is_management
(--Input that goes into the function:
	@empid int --Employee id
)
RETURNS BIT
AS
BEGIN
	--Declare the return variable:
	DECLARE @result AS BIT

	--Compute it:
	IF EXISTS(SELECT * FROM fudgemart_employees
			WHERE employee_id=@empid AND employee_jobtitle <> 'Sales Associate')
		SET @result = 1
	ELSE
		SET @result = 0

	--Return it:
	RETURN @result
END

--When executed:
--Commands completed successfully.

--Check:
--Object Explorer -> FudgemartPracticingDB -> Programmability -> Functions -> Scalar-valued Functions -> dbo.is_management