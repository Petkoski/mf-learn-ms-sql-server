CREATE VIEW v_employee_wages_2006
AS
SELECT employee_lastname, 
	employee_firstname, 
	employee_hourlywage,
	SUM(timesheet_hours) AS total_hours,
	employee_hourlywage * SUM(timesheet_hours) as annual_salary,
	CASE WHEN SUM(timesheet_hours)-2080<0 THEN 0
		ELSE SUM(timesheet_hours)-2080 END AS overtime_hours
FROM fudgemart_employees JOIN fudgemart_employee_timesheets
	ON employee_id = timesheet_employee_id
WHERE YEAR(timesheet_payrolldate)=2006
GROUP BY employee_lastname, employee_firstname, employee_hourlywage